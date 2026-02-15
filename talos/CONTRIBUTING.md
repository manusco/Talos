# Contributing to Talos

> **"Improve, Don't Replace."**

This framework is a living organism. When updating it, adhere to these principles.

## 1. The Prime Directive
We do not delete functioning organs. We **refine**, **consolidate**, or **evolve** them.
*   *Bad*: Deleting `WORKFLOW_MAP` because you don't like list format.
*   *Good*: Refactoring `WORKFLOW_MAP` into a Mermaid diagram for clarity.

## 2. First Principles Design
Every addition must answer:
1.  **Is it Fractal?** Does this apply to a 1-person team and a 1000-person team?
2.  **Is it Atomic?** Is the Skill distinct and reusable?
3.  **Is it Tested?** Did you add a Golden Set?

## 3. The "Golden Set" Rule
You cannot add a new **Workflow** or **Skill** without a `tests/` folder.
*   **Input**: A real-world example trigger.
*   **Output**: The "Perfect" human-verified result.
*   **Why**: To prevent regression when models change.

## 4. Documentation Standards
*   **Tone**: "Industrial, Precise, No Fluff." (See `2_context/BUSINESS_LOGIC.md`).
*   **Naming**:
    *   **Noun** for Objects (`MAP.md`).
    *   **Verb** for Actions (`launch_campaign.md`).
    *   **Snake_Case** for folders/files (`software_engineering/`).

## 5. Updates
*   When changing the *Structure*, update `talos/README.md`.
*   When changing the *Logic*, update `2_context/BUSINESS_LOGIC.md`.
