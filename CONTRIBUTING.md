# Contributing to Talos

> **"We are building an Organism, not a script."**

Talos is an **opinionated** framework. We value **Structure** over Creativity, and **Context** over Speed.

## The Ethos (Read this first)

Before you open a PR, understand the **15 Immutable Laws** in `talos/0_framework/PRINCIPLES.md`. The most critical for contributors are:

1.  **The Map IS The Territory**: You cannot change the code without updating `ARCHITECTURE.md`. If the docs and the folder structure disagree, the PR will be closed.
2.  **Evolution > Revolution**: Do not delete legacy capabilities without migration. Improve in place.
3.  **Silence is Golden**: Your code should be readable enough that you don't need to explain it in the PR description.

## The Workflow

### 1. The "Docs First" Rule
If you want to add a new feature (e.g., a new Workflow):
1.  **Create the File**: `talos/3_workflows/your_workflow.md`.
2.  **Define the Logic**: Write the pseudo-code or flow diagram *in the markdown*.
3.  **Implement**: Only then do you write the code/script.

### 2. The Golden Set
Every Worker/Skill must have a **Golden Set** of inputs and expected outputs in its `tests/` folder.
*   **Bad**: "It works on my machine."
*   **Good**: "It passes the `test_golden_set.py` verification."

## Style Guide

*   **Markdown**: Use standard GFM. Headers use `#`, `##` (not `===`).
*   **Naming**:
    *   Directories: `snake_case` (e.g., `market_research`).
    *   Files: `SCREAMING_SNAKE_CASE.md` for Core Framework (`MANIFESTO.md`, `ROLES.md`).
    *   Files: `snake_case.md` for Workflows (`onboarding_flow.md`).

## The "No Magic" Clause
Talos rejects "Smart Wrappers" that hide the prompt. If your PR adds a layer of abstraction that prevents the user from seeing the raw LLM interaction, it will be rejected. **Transparency is non-negotiable.**

---

**"Build for the Agent that will replace you."**
