# Per-user rate limiting with Redis

## The problem

One person sends forty messages in a minute — testing, frustrated, or automated. Every one of them triggers an LLM call and an outbound message. Cost and latency go up for everybody.

## The approach

Count requests per user in a short window using a Redis counter with a TTL. Past the limit, answer once with a friendly note and stop.

## Notes

- The key carries the window, so it expires on its own — nothing to clean up.
- Set the TTL only on the first increment.
- Tell the user they are being throttled. Silence reads as a broken bot.

## Files

| File | What it is |
| --- | --- |
| `workflow.json` | Import into n8n: **Workflows → ⋯ → Import from File** |

> Credentials are not included. Attach your own after importing.
