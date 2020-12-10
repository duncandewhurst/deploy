{% from 'lib.sls' import apache, set_firewall, unset_firewall %}

{% if salt['pillar.get']('apache:public_access') %}
  {{ set_firewall("PUBLIC_HTTP") }}
  {{ set_firewall("PUBLIC_HTTPS") }}
{% else %}
  {{ unset_firewall("PUBLIC_HTTP") }}
  {{ unset_firewall("PUBLIC_HTTPS") }}
{% endif %}

apache2:
  pkgrepo.managed:
    # The comments about `python-software-properties` and `python-pycurl` in the SaltStack documentation seem to be for
    # old versions of Ubuntu. (`software-properties-common` replaced `python-software-properties`.)
    # https://docs.saltstack.com/en/latest/ref/states/all/salt.states.pkgrepo.html
    - ppa: ondrej/apache2
  pkg.installed:
    - name: apache2
  service.running:
    - name: apache2
    - enable: True
    - require:
      - pkg: apache2

# This uses the old style. It's not clear how to opt-in to the new style when using Agentless Salt.
# https://docs.saltstack.com/en/latest/ref/states/all/salt.states.module.html
apache2-reload:
  module.wait:
    - name: service.reload
    - m_name: apache2

{% if salt['pillar.get']('apache:sites') %}
{% for name, entry in pillar.apache.sites.items() %}
{{ apache(name, entry) }}
{% endfor %}
{% endif %}
