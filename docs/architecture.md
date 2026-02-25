# Architecture

This homelab is run like a small platform team setup: git is the contract, automation executes it.

## Who does what

- **GitHub** stores desired state and approval history.
- **UniFi UDM Pro** enforces network and edge policy.
- **Proxmox** runs the VM workloads.
- **Ansible** keeps guest OS configuration consistent.

## How changes flow

1. Change is proposed in a PR.
2. CI validates formatting, policy, and plans.
3. After merge, apply jobs push the change to infra.
4. If someone makes an emergency manual fix, a follow-up PR brings git back in sync.

## Public repo boundary

Reusable code and examples live here. Real secrets and environment-specific values come from encrypted files or GitHub secrets at runtime.
