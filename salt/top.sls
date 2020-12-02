# Defines which states should be applied for each target and is used by the state.apply command.

base:
  '*':
    - core

  'ocds-docs-live':
    - ocds-docs-live
    - ocds-legacy
    - tinyproxy
    - prometheus-client-apache

  'standard-search':
    - standard-search
    - prometheus-client-apache

  'redash2':
    - redash
    - prometheus-client-apache

  'toucan':
    - toucan
    - prometheus-client-apache

  'cove-*':
    - cove
    - prometheus-client-apache

  'kingfisher-process*':
    - postgres
    - ocdskingfisher
    - ocdskingfisherarchive
    - ocdskingfishercollect
    - ocdskingfisherprocess
    - ocdskingfisheranalyse
    - prometheus-client-apache

  'kingfisher-process1':
    - postgres.replica_master

  'kingfisher-replica*':
    - postgres
    - prometheus-client-apache

  'prometheus':
    - prometheus-server
    - prometheus-client-apache

  'maintenance:enabled:true':
    - match: pillar
    - maintenance.hardware_sensors
    - maintenance.patching
    - maintenance.postgres_monitoring
    - maintenance.raid_monitoring
    - maintenance.rkhunter

  'covid19-dev':
    - covid19
