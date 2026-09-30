# Instant acknowledgement, then process

## The problem

A provider sends you a webhook and expects a fast response. If your workflow does the real work before replying, the provider times out and re-delivers the same event — so your users get the same reply two or three times.

## The approach

Answer the webhook immediately with a 200, then carry on processing. The provider is satisfied within milliseconds and never retries.

## Notes

- Meta, WhatsApp Cloud API, Stripe and most platforms retry aggressively on a slow response.
- Set the webhook node to `responseMode: responseNode`, and put the respond node first in the chain.
- Everything after the respond node runs on its own — the caller is already gone.

## Files

| File | What it is |
| --- | --- |
| `workflow.json` | Import into n8n: **Workflows → ⋯ → Import from File** |

> Credentials are not included. Attach your own after importing.
