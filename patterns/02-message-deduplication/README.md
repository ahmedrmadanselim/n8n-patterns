# Deduplicate by message id

## The problem

The same event arrives twice — a provider retry, a double tap, two webhook subscriptions. Without a guard, the customer gets answered twice.

## The approach

Let the database decide. Insert the provider's message id into a table with a unique constraint and `ON CONFLICT DO NOTHING`. If nothing comes back, you have seen this message before — stop.

## Notes

- The check and the claim happen in one statement, so two workers racing cannot both win.
- A check-then-insert in code has a race window. A unique index does not.
- Keep a `seen_at` column and prune old rows on a schedule.

## Files

| File | What it is |
| --- | --- |
| `workflow.json` | Import into n8n: **Workflows → ⋯ → Import from File** |
| `schema.sql` | The table this pattern needs |

> Credentials are not included. Attach your own after importing.
