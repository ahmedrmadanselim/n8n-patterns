# Poll an async job until it is ready — and give up

## The problem

Some APIs accept your upload and hand back a job id. The result is not ready yet. Instagram media containers, Canva exports and video renders all behave this way. A naive workflow reads the result too early and fails, or loops forever when the job never finishes.

## The approach

Create, wait, check, and loop back — while counting attempts so the loop always terminates.

## Notes

- The attempt counter is what separates a pattern from an incident.
- Give the give-up branch somewhere useful to go — an alert, a retry queue, a human.
- Back off: a fixed short wait hammers the API for slow jobs.

## Files

| File | What it is |
| --- | --- |
| `workflow.json` | Import into n8n: **Workflows → ⋯ → Import from File** |

> Credentials are not included. Attach your own after importing.
