# A dedicated error handler, with deduplication

## The problem

n8n lets you set an error workflow per workflow, and most people never do. When something breaks at 3am, nobody finds out until a customer complains. And when you do wire up alerts, a failing cron fires one every minute until you mute the channel — which means you also mute the next real incident.

## The approach

One error workflow for the whole instance. It fingerprints the failure, suppresses repeats of the same fingerprint inside a window, and only then sends the alert.

## Notes

- Set this as the error workflow in each workflow's settings.
- Fingerprint on workflow + node + error message, not on the timestamp.
- A deduplicated alert is one you still trust six months later.

## Files

| File | What it is |
| --- | --- |
| `workflow.json` | Import into n8n: **Workflows → ⋯ → Import from File** |
| `schema.sql` | The table this pattern needs |

> Credentials are not included. Attach your own after importing.
