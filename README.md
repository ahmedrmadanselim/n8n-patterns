# n8n production patterns

Six patterns that decide whether an n8n workflow survives contact with real traffic.

Every one of them exists because of a specific failure I have had to fix in
production — a customer answered twice, a cron alerting every sixty seconds
until someone muted the channel, a media upload read before the provider had
finished with it.

Each folder holds a workflow you can import directly, the table it needs where
one applies, and a short note on why the pattern is shaped the way it is.

---

## The patterns

| | Pattern | Solves |
| --- | --- | --- |
| 01 | [Instant acknowledgement, then process](patterns/01-instant-ack-webhook) | The provider re-delivers the same event because your workflow answered too slowly |
| 02 | [Deduplicate by message id](patterns/02-message-deduplication) | The same message handled twice, and the race condition a code-level check cannot close |
| 03 | [Per-user rate limiting with Redis](patterns/03-rate-limiting) | One user sending forty messages a minute, and paying for all of them |
| 04 | [Poll an async job until ready — and give up](patterns/04-poll-until-ready) | Reading a result before the provider has produced it, and looping forever when it never arrives |
| 05 | [A dedicated error handler, with deduplication](patterns/05-error-handler-workflow) | Silent 3am failures, and alert fatigue from the ones that are not silent |
| 06 | [Rules before the model](patterns/06-rules-before-llm) | Paying an LLM to answer "thanks" and "what time do you open" |

---

## Using them

1. Download the `workflow.json` from a pattern folder.
2. In n8n: **Workflows → ⋯ → Import from File**.
3. Run the `schema.sql` where the pattern includes one.
4. Attach your own credentials — none are included here.

The workflows are deliberately minimal. They are reference implementations of
one idea each, not finished systems. Take the shape, not the copy.

---

## Why these six

Most n8n material shows you how to connect two services. Very little of it
covers what happens on day thirty, when the same webhook fires twice, a
provider rate-limits you, an upload takes longer than expected, or a scheduled
workflow fails quietly all weekend.

That gap is where automation projects actually die. These six are the patterns
I reach for first on anything that has to keep running without me watching it.

Two ideas run through all of them:

**Put guarantees in the database, not in the code.** A unique index cannot be
raced. A check in a Code node can.

**Make the expensive path the exception.** Cheap deterministic logic should
resolve the common cases, and the model, the API call or the retry loop should
only run when it has to.

---

## About

Built by **Ahmed Ramadan Mohamed Selim** — Automation & AI Systems Developer,
n8n Specialist.

I build production automation systems: multi-tenant platforms, AI agents
grounded in a business's own data, and complete systems with a database,
dashboards and error alerting.

[ahmedramadan.pages.dev](https://ahmedramadan.pages.dev) ·
[LinkedIn](https://www.linkedin.com/in/ahmedramadanselim) ·
mr.ahmedselim87@gmail.com

Client work stays private. These are the general patterns underneath it.

---

MIT licensed. Use them, change them, ship them.
