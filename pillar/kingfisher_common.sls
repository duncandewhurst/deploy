postgres:
  backup:
    stanza: kingfisher
    retention_full: 4
    s3_bucket: ocp-db-backup
    s3_endpoint: s3.eu-central-1.amazonaws.com
    s3_region: eu-central-1
    repo_path: /kingfisher
