# Growth: Scaling the System

> **"Complexity kills. Scale simply."**

How do we add Skills without adding bloat?

## 1. Adding Skills (The Skill Layer)
Don't just "add a tool." Follow the procedure:
1.  **The Need**: Does this skill solve a recurring "Handoff"?
2.  **The Prototype**: Write a separate script (Python/Bash) that works *perfectly* without an agent.
3.  **The Wrapper**: Wrap it in `SKILL.md` with:
    *   **Progressive Disclosure**: Only expose the inputs, not the logic.
    *   **Verification**: The skill must self-test its output.
4.  **The Test**: Run it 10 times. If it fails once, it's not ready.

## 2. Adding Agents (The Team Layer)
Do we need a new Agent?
*   **NO**: If the existing Architect/Builder can do it with a new Skill.
*   **YES**: If the *Perspective* is different (e.g., a "Security Auditor" sees the world differently than a "Builder").

### The onboarding Checklist
1.  Create `agents/NEW_ROLE.md`.
2.  Define its `SOUL.md` variance (e.g., "Paranoid," "Creative").
3.  Assign strict Tool Allowlist (Least Privilege).

## 3. Hiring Humans (The Captain Layer)
As the system grows, you need more **Captains**, not more Engineers.
*   Hire for **Taste**.
*   Hire for **Strategy**.
*   Train them to write clear Directives (`VISION.md`), not code.

## 4. Network Effects (The Knowledge Graph)
*   **Day 1**: The Agent knows nothing.
*   **Day 100**: The `brain/library/` is full of solved patterns.
*   **Growth Hack**: Periodically "Compress" the library. Identify duplicated patterns and merge them into a "Master Skill."
