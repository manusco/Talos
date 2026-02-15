# Handoff Protocol: When Silicon Fails

> **"A stuck agent is not a failure of the agent. It is a failure of the instructions."**

In Talos, we treat "Stuckness" as a high-value signal.

## 1. The Trigger Conditions
An agent must trigger a **Handoff** if:
1.  **Looping**: It has attempted the same step 3 times with the same error.
2.  **Ambiguity**: It encounters a decision not covered by `0_framework/PRINCIPLES.md` or `1_strategy/MANIFESTO.md`.
3.  **High Stakes**: It is about to execute a `CRITICAL` risk action (e.g., Delete DB, Public Post).
4.  **Low Confidence**: Its internal self-criticism score takes a dip below 70%.

## 2. The Handoff Package
When handing off, the agent MUST produce a `failure_report.md` containing:
*   **Context**: What was I trying to do?
*   **Trace**: What steps did I take? (Link to logs).
*   **Blocker**: Exact error message or ambiguity description.
*   **Hypothesis**: Why do I think I failed?
*   **Request**: What specifically do I need from the Human? (e.g., "Clarify objective," "Grant permission," "Fix bug").

## 3. The Human Intervention (The "God Mode")
The Human steps in to:
1.  **Unblock**: Provide the missing key/decision.
2.  **Debug**: Read the logs to see where logic broke.
3.  **Refine**: Update the `SKILL.md` to prevent this specific failure mode in the future.

## 4. The Resume Protocol
After intervention:
1.  **Clear Context**: The agent's memory (`2_context/memory/`) is wiped of the "flailing."
2.  **Inject Insight**: The Human's solution is added to the fresh context.
3.  **Restart**: The agent retries the step with the new knowledge.

## 5. Anti-Pattern: "The Babysitter"
If you are handing off more than 10% of the time, your **Skills** are too vague or your **Tasks** are too large. Decompose the task.
