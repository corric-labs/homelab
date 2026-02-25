# Network Zones

The network model is intentionally simple so it is easy to reason about and audit.

- `mgmt`: management plane (automation, infra APIs, admin tooling)
- `internal`: private services not meant for internet exposure
- `dmz`: internet-facing platform services
- `tenant`: shared tenant network for a small number of mostly trusted users

## Default rules

- deny by default between zones
- tenant traffic cannot reach `mgmt`
- no tenant-to-tenant lateral traffic unless explicitly approved
- HTTP/S should go through reverse proxy first
- no direct WAN SSH to tenant VMs; use one controlled SSH entry point
