# Self-Hosted Runner Setup

GitHub-hosted runners used for early scaffolding.

Switching to a self-hosted runner when plan/apply needs private access to UniFi, Proxmox, or MinIO.

## Recommended setup

- dedicated Ubuntu VM in `mgmt`
- key-only SSH
- minimal packages + security updates enabled
- runner service under non-root account

## Network access needed

- outbound to GitHub Actions
- API access to MinIO, Proxmox, and UniFi

## Labels to use

- `self-hosted`
- `homelab`
- `mgmt`
