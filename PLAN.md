# Homelab Implementation Plan

This is the practical roadmap for building the repo into a working GitOps control plane.

## North Star

- GitHub is source of truth.
- UniFi UDM Pro + Proxmox changes happen through PRs, not ad-hoc clicks.
- This repo stays public-safe: reusable code is public, sensitive values stay in secrets.

## Architecture at a glance

- **Network:** UniFi UDM Pro (`edge` stack)
- **Compute:** Proxmox VMs (`core`, `dmz`, `tenants` stacks)
- **Config:** Ansible convergence after provisioning
- **State:** MinIO backend
- **Security model:** shared tenant VLAN, strict firewall, reverse proxy first for HTTP/S, SSH via single entry point

## Implementation phases

## Phase 0 - Foundation (now)

Goal: establish safe repo, CI checks, and secret handling.

- finalize repo structure and core docs
- protect `main` and enforce PR checks
- wire `sops + age` and GitHub secrets
- keep workflows on GitHub-hosted runners for now

Done when:
- CI validate/plan run cleanly
- no secrets or state can be committed accidentally

## Phase 1 - Edge GitOps

Goal: manage UniFi intent from code.

- define edge data model (VLANs, firewall, NAT, DHCP, routes)
- implement OpenTofu/provider path where possible
- use policy checks for risky inbound rules (owner + expiry required)

Done when:
- a firewall/VLAN change can be proposed in PR and applied from pipeline

## Phase 2 - Proxmox VM provisioning

Goal: provision Ubuntu VMs from manifests.

- build reusable VM module
- apply sane defaults for CPU/RAM/disk and naming
- wire zone-aware network assignment (`core`, `dmz`, `tenants`)

Done when:
- a new VM request in git becomes a running VM on correct network

## Phase 3 - Ansible baseline

Goal: consistent host config after provision.

- key-only SSH baseline
- package and update baseline
- monitoring/logging bootstrap

Done when:
- newly provisioned VMs converge automatically after apply

## Phase 4 - Tenant self-service API

Goal: request flow for semi-trusted tenants without direct infra access.

- GitHub OAuth login
- request validation (quota, allowed image/ports)
- API opens PRs instead of mutating infra

Done when:
- tenant request -> PR -> approval -> provisioning works end-to-end

## Phase 5 - Ops hardening

Goal: reliable operations with limited disk budget.

- snapshot policy for key VMs
- drift detection and reconciliation process
- backup/restore drills on one representative service

Done when:
- restore path is tested and documented

## Non-negotiable guardrails

- no direct pushes to `main`
- no plaintext secrets in git
- no direct WAN SSH to tenant VMs
- all WAN-exposed ports need owner + purpose + expiry

## Next up

1. Complete Phase 0 checks in GitHub.
2. Build the first real `stacks/edge/tofu` module wiring.
3. Add the first Proxmox Ubuntu VM module.
