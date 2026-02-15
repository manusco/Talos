# Heartbeat: The Pulse of Maintenance

> **"Don't let the agent rot. Give it a regular grooming routine."**

A "Heartbeat" is a lightweight routine that runs frequently to keep the agent healthy. It is distinct from heavy "Cron" jobs.

## The Checklist (`HEARTBEAT.md`)

Create a file named `HEARTBEAT.md` in your `workspace/` and instruct your agent to read it every 30-60 minutes.

```markdown
# Heartbeat Checklist

## Every Run (~30 min)
- [ ] **Check Active Tasks**: Read `memory/active-tasks.md`. If a task is stale (>2h), flag it.
- [ ] **Check Cron Jobs**: If a scheduled job hasn't run, force it.
- [ ] **Archive Check**: If current session context > 80%, trigger auto-summarization.

## Every ~4 Hours
- [ ] **Self-Review**: Log one observed failure/success to `memory/self-review.md`.
- [ ] **Memory Flush**: Move durable facts from short-term context to `memory/lessons.md`.

## Daily (08:00 Local)
- [ ] **Morning Brief**: Read yesterday's logs and `active-tasks.md`. Plan the day.
- [ ] **Prune**: Remove temp files older than 24h.
```

## Why this matters
Without a heartbeat, agents only act when spoken to. They effectively "die" between prompt chains. A heartbeat gives them a pulse to clean up their own mess.
