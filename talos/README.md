# Talos Technical Manual

> **"The Engine Room."**

This folder contains the **Source Code** of your Organization.
Unlike the root README (which sells the vision), this document explains the **Mechanics**.

## The Architecture (The 4 Immutable Layers)

### 0. Framework (`talos/0_framework/`)
**The Machine**. How the system works.
*   `THE_HANDBOOK.md`: The User Manual.
*   `ARCHITECTURE.md`: The visual structure.
*   `ROLES.md`: Human/Agent separation.
*   `PRINCIPLES.md`: Decision heuristics.
*   `PATTERNS.md`: Common solutions.
*   `GUARDRAILS.md`: Safety limits.
*   `IDENTITY.md`: Persona definition.
*   `ESCALATION.md`: Handoff protocols.
*   `KNOWLEDGE.md`: Learning storage.
*   `AGENT_OPTIMIZATION.md`: How to make content agent-readable (AEO).
*   `FAQ.md`: Questions.

### 1. Strategy (`talos/1_strategy/`)
**The Direction**. Why do we exist? Where are we going?
*   `MANIFESTO.md`: The Vision, Mission, and Values.
*   `GOALS_AND_ROADMAP.md`: The Targets (What) and Path (How).

### 2. Context (`talos/2_context/`)
**The Knowledge Base**.
*   `SYSTEM_MAP.md`: Where data lives.
*   `BUSINESS_LOGIC.md`: Domain rules.
*   `memory/`: Active State & Logs.
*   `GUARDRAILS.md`: Operational Safety Limits.

### 3. Workflows (`talos/3_workflows/`)
**The Engine**. The Process Management Layer.
*   **The Map**: `WORKFLOW_MAP.md` defines dependencies.
*   **The Flows**: `[Domain]_[Process].md` files defining the Trigger, Flow, and DoD.
*   **Determinism**: Rigid flows use `n8n` (linked). Fluid flows use Agents.
*   **Verification**: Every workflow includes a `tests/` folder with **Golden Sets**.

### 4. Skills (`talos/4_skills/`)
**The Toolbox**. High-Level functional skills.
*   **No Roles**: We do not have "Roles" or "Departments."
*   **Resonance Style**: Skills are high-level (e.g., `software_engineering`, `market_research`).
*   **Structure**: Each Skill includes:
    *   `[Domain]/[Skill]/README.md`: The System Prompt.
    *   `scripts/`: Deterministic Tools.
    *   `tests/`: Verification Suite.

## How to Work with Talos

### 1. Triggering Work
Find the relevant Workflow in `3_workflows/`.
*   Check the **Trigger** condition.
*   Provide the **Input** defined in the schema.

### 2. Updating Logic
*   **New Rule?** Add it to `2_context/BUSINESS_LOGIC.md`.
*   **New Data Source?** Add it to `2_context/SYSTEM_MAP.md`.

### 3. Adding Skills
*   Create a new folder in `4_skills/`.
*   Follow the `Skill_STD.md` template.
