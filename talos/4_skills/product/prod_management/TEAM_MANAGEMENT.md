# Team Management: The "HR" Department

> **"If you're building with AI, you're not just a developer anymore, you're a manager."**

This guide covers the *organizational* side of running an agent swarm.

## 1. The Leveling System (Risk Mitigation)

Don't give new agents root access. Promote them through levels.

| Level | Role | Permissions |
| :--- | :--- | :--- |
| **L1** | **Observer** | **Read-Only**. Can research, read files, draft answers. Cannot execute code or write files. |
| **L2** | **Advisor** | **Propose-Only**. Can propose shell commands or file edits. User must explicitly approve every action. |
| **L3** | **Operator** | **Limited Autonomy**. Can execute within a sandbox. Reports daily. |
| **L4** | **Autonomous** | **Full Access**. Trusted with API keys and production deployment. (Rare). |

**Implementation**: Use `openclaw config set tools.deny` to enforce levels. L1 denies `exec` and `write`.

## 2. Hiring & Onboarding (`SOUL.md`)

Treat creating an agent like writing a Job Description.

### The "Hiring" Template
Your `SOUL.md` should include:
*   **Origin Story**: *Why* does this agent exist? (e.g., "You were created by the Google DeepMind team...")
*   **North Star**: What is the ONE thing that matters? (e.g., "Accuracy above all," or "Speed and brevity.")
*   **Inspirational Anchors**: "Write like Hemingway," "Think like Feynman."

## 3. Shared Context Protocol (`CONTEXT.md`)

When multiple agents work on one project, they need a shared whiteboard. **Mental notes do not survive session resets.**

### The Structure
```text
workspace/projects/website-redesign/
├── ACCESS.md       # Who can touch this? (e.g., "builder: rw, critic: ro")
├── CONTEXT.md      # The current state of reality.
└── research/       # Raw data.
```

### The Protocol
1.  **Read First**: Every agent reads `CONTEXT.md` before doing anything.
2.  **Update Last**: If an agent changes the state of the project, it MUST update `CONTEXT.md`.
3.  **Signature**: Append `(Updated by: Builder, Time: 12:00)` to updates.
