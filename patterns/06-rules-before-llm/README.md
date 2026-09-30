# Rules before the model

## The problem

Sending every incoming message to a language model is the default, and it is wasteful. A large share of messages are greetings, thank-yous, working-hours questions and exact repeats of a known FAQ. Paying for a model call, and waiting for it, adds cost and latency and a chance of a wrong answer.

## The approach

Run a cheap deterministic layer first. Ignore what should be ignored, answer templated cases from a template, and only reach the model for messages that genuinely need understanding.

## Notes

- In production this routinely resolves half of all inbound messages with no model call.
- Templates cannot hallucinate. For prices and hours, that matters more than fluency.
- Keep the rules in data, not in code, so non-developers can add to them.

## Files

| File | What it is |
| --- | --- |
| `workflow.json` | Import into n8n: **Workflows → ⋯ → Import from File** |

> Credentials are not included. Attach your own after importing.
