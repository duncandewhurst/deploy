prometheus:
  node_exporter:
    smartmon: true

vm:
  nr_hugepages: 8325

postgres:
  public_access: True
  version: 11
  configuration: kingfisher-replica1
