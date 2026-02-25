# homelab

This repo is the control plane for my homelab.

The goal is simple: all routine changes go through pull requests, and infrastructure follows what is in git.

## What lives here

- OpenTofu/Terraform code for Proxmox and network intent
- Ansible for VM configuration
- policy checks and GitHub workflows
- sanitized example manifests for edge and tenants

## Public repo rules

This is a public repository, so real environment details do not belong here.

Never commit:
- secrets or private keys
- real hostnames, IP mappings, or internal DNS names
- state files and plan artifacts

Use GitHub secrets and/or SOPS-encrypted files for sensitive values.

## Required GitHub secrets

- `SOPS_AGE_KEY`
- `TF_STATE_ACCESS_KEY_ID`
- `TF_STATE_SECRET_ACCESS_KEY`
- `TF_STATE_REGION`
- `TF_STATE_BUCKET`
- `TF_STATE_ENDPOINT`

If these are not set yet, CI plan will skip backend planning instead of failing.

## Current workflow mode

Workflows currently run on `ubuntu-latest` so setup is easy. That works for validation and planning scaffolding.

When applies need private access to UniFi/Proxmox, move those jobs to a self-hosted runner on the management network.

## Branch naming

Use this lightweight pattern:

- `type/area-short-description`

Examples:

- `feat/edge-unifi-stack`
- `feat/proxmox-vm-module`
- `chore/ci-sops-setup`
- `docs/phase0-cleanup`
- `fix/policy-tenant-ssh`

Implementation roadmap: `PLAN.md`.
