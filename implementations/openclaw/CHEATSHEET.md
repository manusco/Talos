# OpenClaw Mega Cheatsheet 2026

> **Complete CLI Reference & Developer Guide**

## Core CLI Commands

### Service Management
```bash
openclaw gateway                      # Run WebSocket gateway
openclaw gateway start|stop|restart   # Manage background service
openclaw doctor --deep                # Health checks + quick fixes
openclaw logs --follow                # Tail logs
```

### Channel Management
```bash
openclaw channels login               # WhatsApp QR pairing
openclaw channels add                 # Add Telegram/Discord/Slack bot --token
openclaw channels status --probe      # Check channel health
```

### Quick Installation
```bash
npm install -g openclaw@latest
openclaw onboarding --install-daemon
```

*Global Flags:*
- `--dev`: Isolated state under `~/.openclaw-dev`
- `--profile <name>`: Isolated state under `~/.openclaw-<NAME>`
- `--json`: Machine-readable output
- `--no-color`: Disable ANSI colors

## Power Commands

### Configuration
```bash
openclaw config get|set|unset         # Read/Write config values
openclaw models list|set|status       # Model management
openclaw models auth setup-token      # Preferred Auth flow
```

### Memory & Knowledge
```bash
openclaw memory status|index          # Check vector index
openclaw memory search "query"        # Semantic search
```

### Automation & Runtimes
```bash
openclaw browser start|screenshot     # Chrome automation ops
openclaw cron list|run <id>           # Manage cron jobs
openclaw subagents list/info          # Check sub-agent status
```

## In-Chat Slash Commands

| Command | Description |
| :--- | :--- |
| `/status` | Health + Context |
| `/context list` | Context contributors |
| `/model <m>` | Switch model |
| `/compact` | Free up window space |
| `/new` | Fresh session |
| `/stop` | Abort current run |
| `/tts on|off` | Toggle speech |
| `/think` | Toggle reasoning |

## Workspace Anatomy

Your agent's brain is located at `~/.openclaw/workspace`.

- **AGENTS.md**: Core instructions.
- **SOUL.md**: Persona/Tone definition.
- **USER.md**: User preferences.
- **IDENTITY.md**: Name/Theme configuration.
- **MEMORY.md**: Long-term curated memory.
- **memory/YYYY-MM-DD.md**: Daily logs.
- **HEARTBEAT.md**: Periodic checklist.
- **BOOT.md**: Startup checklist.

## Troubleshooting

- **No DM Reply**: Check `openclaw pairing list` -> `approve`.
- **Silent in Group**: Check `mentionPatterns` in config.
- **Auth Expired**: Run `openclaw models auth setup-token`.
- **Gateway Down**: Run `openclaw doctor --deep`.
- **Memory Bug**: Run `openclaw memory index`.
