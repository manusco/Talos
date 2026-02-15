# Talos Library: The Standard Reference

> **"Standing on the shoulders of giants (IronClaw, Anthropic, CoworkPowers)."**

This library aggregates high-signal patterns for building Talos agents.

## 1. Security Patterns (Source: IronClaw/ClawGuard)
*   **The Airgap**: Run agents in `network: none` Docker containers unless web access is strictly required.
*   **The Injector**: Never map `.env` files. Inject secrets as environment variables *only* during the specific process execution.
*   **The Canary**: Place a "honeypot" file (e.g., `passwords.txt`) in the workspace. If the agent touches it, `make nuke` immediately.

## 2. Skill Patterns (Source: Anthropic)
*   **The "Use When" Router**:
    ```json
    "description": "Deploy site. USE WHEN: Build is successful. DON'T USE WHEN: Domain is missing."
    ```
*   **The Template Loader**: Don't ask the LLM to "write a report." Give it a `assets/report_template.md` and ask it to "fill the slots."
*   **The 3-Step Verification**:
    1.  **Pre-computation**: Check prerequisites (API up?).
    2.  **Execution**: Do the thing.
    3.  **Post-computation**: Verify output (HTTP 200? File exists?).

## 3. Workflow Patterns (Source: CoworkPowers)
*   **The 4-Phase Loop**: `Research` -> `Work` -> `Review` -> `Compound`.
*   **The "Compound" Meta-Step**:
    *   *Before* Task: Read `talos/0_framework/KNOWLEDGE.md`.
    *   *After* Task: Append new lessons to `talos/0_framework/KNOWLEDGE.md`.

## 4. Operational Patterns (Source: OpenClaw)
*   **The Heartbeat**: A cron job that runs every hour to:
    *   Rotate logs.
    *   Check disk space.
    *   Summarize the day's work into `daily_log.md`.
*   **The Daily Nuke**: Restart containers nightly to clear memory leaks and phantom processes.

## 5. Cheat Codes (Quick Reference)
*   **Reset**: `make nuke`
*   **Logs**: `make logs`
*   **Shell**: `make shell` (Enters the container)
*   **Audit**: `grep "CRITICAL" talos/2_context/memory/audit.log`
