# Workflow: Initialize Organization

> **"Give the machine a Soul."**

This workflow guides you (the Founder/Architect) through the creation of the **Strategy Layer** for your new organization.

## Trigger
*   **User Command**: `@Talos run init`
*   **Context**: You are the "Chief of Staff" interviewing the Founder to extract the DNA of the new company.

## Phase 1: The Interview (Strategy)

**Agent Instruction**: Ask these questions ONE BY ONE. Do not dump them all at once. Wait for the user to answer, then reflect briefly before asking the next.

1.  **The Mission (The "Why")**:
    "We need to define the single driving force of this organization. In one sentence: **What problem does this company solve, and for whom?** (e.g., 'Make pet adoption instant for busy families', not just 'Build an app')."

2.  **The Values (The "Non-Negotiables")**:
    "Every organization needs rules that *cost* something. What are 3 behaviors you will **fire** someone for violating? Or conversely, what behaviors do you reward above all else? (e.g., 'Radical Truth', 'Speed over Safety', 'Pixel Perfection')."

3.  **The Customer (The "Who")**:
    "Who are we obsessed with? Describe your perfect customer in extreme detail. What are their fears? What is their dream outcome?"

4.  **The Constraints (The "Box")**:
    "Creativity needs boundaries. What are the hard operational constraints we must respect? (e.g., 'No paid APIs', 'Must run on mobile', 'Privacy-first / No data retention')."

5.  **The Voice (The "Vibe")**:
    "If this company was a character in a movie, who would it be? How should the agents speak to you and your users? (e.g., 'Tony Stark: Confident & Witty', 'Obi-Wan: Wise & Calm')."

## Phase 2: The Synthesis (Creation)

**Agent Instruction**: Once you have the answers, generate the **Seminal Artifacts**.

### Step 1: Create `talos/1_strategy/MANIFESTO.md`
Synthesis the answers into a high-impact document.

```markdown
# The Manifesto

> **"[Insert Inspiring Mission Quote derived from Answer 1]"**

## 1. Vision & Mission
[A powerful paragraph synthesizing Answer 1. Make it sound inevitable.]

## 2. Core Values (The Constitution)
*   **[Value 1]**: [Actionable description]
*   **[Value 2]**: [Actionable description]
*   **[Value 3]**: [Actionable description]

## 3. The Customer
[Detailed persona from Answer 3]

## 4. Strategic Constraints
*   [List from Answer 4]

## 5. The Voice
*   [Vibe description from Answer 5]
```

### Step 2: Create `talos/2_context/SYSTEM_MAP.md` (Stub)
Create the initial map of the territory.

```markdown
# System Map

> **"The Territory."**

## 1. File Structure
*   `talos/` (The Framework)
*   `implementations/` (The Code)

## 2. Key Resources
*   [Auto-generated from user's setup if any, otherwise leave blank]
```

## Phase 3: The Handshake

1.  **Output**: "Organization Initialized. Soul injected."
2.  **Instruction**: "Your Strategy is now codified in `talos/1_strategy/MANIFESTO.md`. Run `./talos.sh check` to verify your new body."
