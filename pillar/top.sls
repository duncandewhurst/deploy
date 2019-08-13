# This file defines what pillars should be used for our servers
# For each environment we have a public and a private pillar

base:
  '*':
     - common_pillar
     - private.common_pillar

  'ocdskingfisher-new':
     - ocdskingfisher_live_pillar
     - private.ocdskingfisher_live_pillar
     - private.ocdskingfisher_pillar

  'ocds-docs-live':
     - live_pillar

  'ocds-docs-staging':
     - staging_pillar

  'standard-search':
     - live_pillar
     - private.standard_search_pillar

