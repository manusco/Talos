# The 10 Principles of Talos

> **"Trust, but verify. Then verify the verification."**

## 1. The Rule of Two (Draft & Critic)
Never let an agent mark its own homework. Every output must be reviewed by a distinct "Critic" agent before it touches a human.

## 2. Friction is Signal
When an agent gets stuck, it is not a bug; it is a lack of information. Do not force it. Stop, ask the human, document the missing variable.

## 3. Taste over Completion
A completed task that is "generic" is a failure. The agent must present **Options**, not just answers. "Mastery" means understanding nuance, not just checking a box.

## 4. Blast Radius Control
Assume the agent *will* be compromised.
*   **Principle**: Minimal Privilege.
*   **Practice**: Sandboxing (WASM/Docker), Read-Only by default, Human Gate for `critical` actions.

## 5. Skills are Recipes
Do not rely on the LLM's "smarts."
*   **Incorrect**: "Write a blog post."
*   **Correct**: "Execute `blog-writer` skill (Research -> Outline -> Draft -> Critique -> Polish)."

## 6. Everything is a File
*   Identity is a file (`talos/1_strategy/MANIFESTO.md`).
*   Knowledge is a file (`talos/0_framework/KNOWLEDGE.md`).
*   State is a file (`talos/2_context/memory/state.md`).
*   If it's not in a file, it doesn't exist.

## 7. The 24-Hour Reset
Context rot is inevitable.
*   **Protocol**: Wipe the agent's memory (`talos/2_context/memory/`) daily.
*   **Preserve**: Only extracting "Gold" (Lessons, Patterns) into long-term storage (`talos/0_framework/KNOWLEDGE.md`).

## 8. Human-in-the-Loop is a Feature
We do not aim to remove the human. We aim to elevate the human. Use `notify_user` liberally for architectural decisions, taste checks, and high-stakes approvals.

## 9. Tools, not magic
Agents are just software that can read.
*   Give them **boring** tools (`grep`, `curl`, `write_file`).
*   Avoid "magic" tools that do too much hidden logic.

## 10. Value > Tech
Does this action make the company improved? Does it serve the mission? If not, `make nuke` it.

## 11. Evolution > Revolution (The "Anti-Nuke" Law)
We verify before we delete. We improve before we replace.
*   **Rule**: "Never delete a file unless you have migrated its value to a new location. Chesterton's Fence applies: Know *why* it exists before you kill it."

## 12. The Map IS The Territory (The "Anti-Drift" Law)
Documentation is not a sidecar; it is the source code of the organization.
*   **Rule**: "If the folder structure changes, `0_framework/ARCHITECTURE.md` MUST change in the same commit. Mismatches are bugs."

## 13. The Bus Factor (The "Amnesia" Law)
Agents die. Context is wiped.
*   **Rule**: "Design every task assuming the agent will die immediately after completion. State must be saved to `2_context/memory/` instantly. No knowledge stays in RAM."

## 14. Context First (The "No Guessing" Law)
Agents hallucinate when they lack context.
*   **Rule**: "Never start a task without reading `1_strategy/MANIFESTO.md` and `2_context/SYSTEM_MAP.md`. Guessing is a firing offense."

## 15. Silence is Golden (The "Output" Law)
Don't chat. Do.
*   **Rule**: "Minimize conversational overhead. If I ask you to fix a bug, fix it and say 'Fixed'. Output > Chatter."
