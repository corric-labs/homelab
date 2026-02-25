# Restore Runbook

At this stage, recovery is code-first. Rebuild from git, then use snapshots where they exist.

## Restore order

1. Confirm access to GitHub, MinIO, Proxmox, and UniFi.
2. Bring up CI/apply capability (runner if required).
3. Re-apply infrastructure from `main`.
4. Re-run Ansible convergence.
5. Validate routing, firewall policy, and service health.

## Practice

Run one restore test each quarter and update this file with what worked and what was slow.
