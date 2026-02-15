# OpenClaw Reference Implementation

> **"A Talos-Compliant Native Implementation."**

This is the **Reference Implementation** of the [Talos Framework](../../talos/README.md). It implements the Talos Blueprint using:
*   **Linux** (Host)
*   **Docker** (Containerization)
*   **Postgres** (Memory)
*   **OpenClaw** (Agent Engine)

## Relationship to Talos
This implementation adheres to the **Talos Constitution**:
*   **Security**: Uses the `talos/patterns` for hardening (see `host/`).
*   **Roles**: Implements the Architect/Builder/Critic swarm.
*   **Operations**: detailed in `../../talos/constitution/OPERATIONS.md`.

## 🚀 Quick Start

```bash
# 1. Setup Host (Hardening)
make setup

# 2. Configure Credentials
cp .env.example .env

# 3. Launch Talos
make install
```

## 🛠️ Operations

| Command | Description |
| :--- | :--- |
| `make nuke` | **Emergency**: Stop everything and wipe volatile memory. |
| `make logs` | **Observe**: Tail logs for all services. |
| `make shell-claw` | **Debug**: Enter the OpenClaw container shell. |
| `make audit` | **Security**: Check for leaked keys or risky tool use. |

## 📚 The Library
- [**TALOS LIBRARY**](standards/TALOS_LIBRARY.md): High-signal patterns and cheat codes.
