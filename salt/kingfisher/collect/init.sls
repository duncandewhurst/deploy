{% from 'lib.sls' import create_user, systemd %}

include:
  - python.virtualenv
  - python.extensions # twisted
  - python.psycopg2

{% set user = pillar.kingfisher_collect.user %}
{% set userdir = '/home/' + user %}
{% set directory = userdir + '/scrapyd' %}

{{ create_user(user) }}

{{ directory }}:
  file.directory:
    - names:
      - {{ directory }}/dbs
      - {{ directory }}/eggs
      - {{ directory }}/logs
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - require:
      - user: {{ user }}_user_exists

{{ directory }}/requirements.txt:
  file.managed:
    - source: https://raw.githubusercontent.com/open-contracting/kingfisher-collect/main/requirements.txt
    - source_hash: https://raw.githubusercontent.com/open-contracting/kingfisher-collect/main/requirements.txt.sha256
    - user: {{ user }}
    - group: {{ user }}
    - mode: 444
    - require:
      - file: {{ directory }}

# The next states are similar to those in the `python_apps.sls` file, but instead of being based on a git repository,
# they are based on a requirements.txt file.

{{ directory }}/.ve:
  virtualenv.managed:
    - python: /usr/bin/python3
    - user: {{ user }}
    - system_site_packages: False
    - pip_pkgs:
      - pip-tools
    - require:
      - pkg: virtualenv
      - file: {{ directory }}

{{ directory }}-requirements:
  cmd.run:
    - name: . .ve/bin/activate; pip-sync -q --pip-args "--exists-action w"
    - runas: {{ user }}
    - cwd: {{ directory }}
    - require:
      - virtualenv: {{ directory }}/.ve
    - onchanges:
      - file: {{ directory }}/requirements.txt
      - virtualenv: {{ directory }}/.ve # if .ve was deleted
    - watch_in:
      - service: scrapyd

# https://scrapyd.readthedocs.io/en/stable/config.html
{{ userdir }}/.scrapyd.conf:
  file.managed:
    - source: salt://kingfisher/collect/files/scrapyd.ini
    - template: jinja
    - context:
        appdir: {{ directory }}
    - watch_in:
      - service: scrapyd

/var/log/scrapyd:
  file.directory:
    - user: {{ user }}
    - group: {{ user }}
    - require_in:
      - service: scrapyd

{{ systemd({'service': 'scrapyd', 'user': user, 'appdir': directory}) }}

{% if pillar.kingfisher_collect.get('summarystats') %}
find {{ userdir }}/scrapyd/logs/ -type f -name "*.log" -exec sh -c 'if [ ! -f {}.stats ]; then result=$(tac {} | head -n99 | grep -m1 -B99 statscollectors | tac); if [ ! -z "$result" ]; then echo "$result" > {}.stats; fi; fi' \;:
  cron.present:
    - identifier: OCDS_KINGFISHER_SCRAPE_LOG_STATS
    - user: {{ user }}
    - minute: 0
    - require:
      - file: {{ directory }}
{% endif %}

{% if pillar.kingfisher_collect.get('autoremove') %}
# Delete crawl logs older than 90 days.
find {{ userdir }}/scrapyd/logs/ -type f -ctime +90 -delete; find {{ userdir }}/scrapyd/logs/ -type d -empty -delete:
  cron.present:
    - identifier: OCDS_KINGFISHER_COLLECT_DELETE_LOGS
    - user: {{ user }}
    - daymonth: 1
    - hour: 2
    - minute: 30
    - require:
      - file: {{ directory }}

# Delete crawl directories containing exclusively files older than 90 days.
find {{ userdir }}/scrapyd/data/ -mindepth 2 -type d -exec bash -c 'if [[ -z $(find {} -ctime -90) ]]; then rm -rf {}; fi' \; find {{ userdir }}/scrapyd/data/ -type d -empty -delete:
  cron.present:
    - identifier: OCDS_KINGFISHER_COLLECT_DELETE_DATA
    - user: {{ user }}
    - daymonth: 1
    - hour: 2
    - minute: 45
    - require:
      - file: {{ directory }}
{% endif %}
