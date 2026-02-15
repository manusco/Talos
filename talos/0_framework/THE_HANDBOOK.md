# The Talos Handbook

> **"The operating manual for the autonomous enterprise."**

This document explains **HOW** the machine works and **HOW** to build within it.

## 1. The Architecture (The 4 Immutable Layers)

To build a scalable organism, we distinguish between the **Framework** (The Machine) and the **Instance** (The Business).

### 0. Framework (`0_framework/`)
**The Laws of Physics**. The universal protocols that make Talos work.
*   `ARCHITECTURE.md`: The structural diagram.
*   `ROLES.md`: The Human/Agent contract.
*   `PRINCIPLES.md`: The decision-making heuristics.
*   `GUARDRAILS.md`: Safety limits and circuit breakers.

### 1. Strategy (`1_strategy/`)
**The Direction**. Why do we exist? Where are we going?
*   `MANIFESTO.md`: Vision and Values.
*   `GOALS_AND_ROADMAP.md`: Dynamic targets.

### 2. Context (`2_context/`)
**The Knowledge Base**. The "Meaning" and "Map".
*   `SYSTEM_MAP.md`: Where data lives.
*   `BUSINESS_LOGIC.md`: Domain rules.
*   `memory/`: Active State & Logs.

### 3. Workflows (`3_workflows/`)
**The Engine**. Process Management.
*   `[Domain]_[Process].md`: Deterministic procedures.

### 4. Skills (`4_skills/`)
**The Toolbox**. Capabilities.
*   `[Domain]/[Skill]/`: Autonomous tools.

---

## 2. The Builder's Code

We build for **Clarity** and **Robustness**.

### A. How We Write
*   **Prune**: If a word doesn't add meaning, kill it. No "very" or "extremely."
*   **Active Voice**: "The Agent writes the code," not "The code is written by the Agent."
*   **One Thought**: One idea per sentence.

### B. Externalized Cognition
**"If it is not in a file, it does not exist."**
Agents die. Chat history fades. The File System is the only persistent Mind.
*   **Strategy**: `talos/1_strategy/MANIFESTO.md` (Soul).
*   **Memory**: `talos/2_context/memory/` (Logs & State).
*   **Knowledge**: `talos/0_framework/KNOWLEDGE.md` (Lessons).

### C. The Ratchet
**"Never solve the same problem twice."**
*   If you fix a bug, write a test.
*   If you learn a quirk, write a doc.
*   Lock progress in place.

---

## 3. Integrity Maintenance

1.  **Do Not Mix**: Do not put business constraints in `README.md`. Put them in `2_context/GUARDRAILS.md`.
2.  **Do Not Hardcode**: Use `SYSTEM_MAP.md` references instead of raw APIs in prompts.
3.  **Upgrade Path**: When improving Standards (`STD.md`), always migrate existing files to match.

---

## 4. Building Workflows & Skills

*   **Workflows**: Define *Process* (`.agent/workflows/` or `3_workflows/`).
    *   *Schema*: Identity -> Prerequisites -> Context -> Algorithm -> Recovery.
*   **Skills**: Define *Capability* (`4_skills/`).
    *   *Expert Test*: Would a top 1% expert use this approach?
    *   *Context First*: Use the existing memory; don't ask the user for what you already know.
