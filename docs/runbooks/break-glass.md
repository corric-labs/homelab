# Break-Glass Runbook

Use this only when service recovery matters more than process (outage, active incident).

## Procedure

1. Note what failed, who is making the change, and the time.
2. Make the smallest manual fix possible in the dashboard/console.
3. Confirm recovery.
4. Open a reconciliation PR within 24 hours.
5. Link incident notes in that PR.

## Rules of thumb

- temporary beats permanent
- minimal scope beats broad change
- no undocumented manual changes left behind
