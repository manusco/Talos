# Workflow Architecture: The "Antfarm" Pattern

> **"One big brain gets confused. Many small brains get it done."**

This guide details how to implement **Deterministic Multi-Agent Workflows**, inspired by the "Antfarm" approach and the **Compound Loop**.

## 1. The Master Workflow: The 4-Phase Loop

Instead of simple task execution, adopt the **4-Phase Loop** to ensure quality and continuous improvement.

### Phase 1: Research (The Foundation)
*   **Stakes Classification**: Decide if this is Low, Medium, or High stakes. Match rigor to the stakes.
*   **Parallel Gathering**: Run specialized agents for Context, Stakeholders, Constraints, and Precedents.
*   **Clarifying Questions**: Never assume. Ask the user for missing variables before starting execution.

### Phase 2: Work (The Execution)
*   **Context Sharding**: Wipe the memory between steps. Pass only the *output* of the previous step.
*   **Specialized Personas**: Switch to the right "Mindset" (e.g., Architect, Builder, Analyst).
*   **Template Application**: Load patterns/templates extracted from previous "Compound" phases.

### Phase 3: Review (The Quality Gate)
*   **Parallel Reviewers**: Run multiple agents checking for Clarity, Tone, Risk, and Devil's Advocate.
*   **Severity Tagging**: Label findings as **Critical**, **Important**, or **Minor**.
*   **Stakes-Based Rigor**: Low-stakes work gets a light pass; High-stakes work gets the full battery.

### Phase 4: Compound (The Mastery)
*   **Lesson Extraction**: After work is done, explicitly extract reusable knowledge.
*   **Discrete Storage**: Save patterns, templates, and failures as single-insight files with YAML frontmatter.
*   **The Meta-Move**: Success is defined by the **Learning Rate**, not just finishing the task.

---

## 2. Role-Based Swarms

Don't have one "Senior Engineer" agent. Create specialized personas in your `workspace/agents/` directory.

### Directory Structure
```text
workspace/
├── agents/
│   ├── architect/       # High-level design, YAML specs
│   │   └── SOUL.md
│   ├── builder/         # Writes code, no opinions
│   │   └── SOUL.md
│   └── critic/          # Reviews code, finds bugs, grumpy
│       └── SOUL.md
```

### The Roles
*   **The Architect**: Output is strictly English/Pseudocode/YAML. Never writes code.
*   **The Builder**: Input is specifications. Output is code. Never questions the design.
*   **The Critic**: Input is code + spec. Output is a list of bugs. Never fixes them.

## 3. Declarative Workflows (YAML)

For complex repeated tasks, define the workflow in a file, not in a prompt.

```yaml
# workflows/feature-dev.yaml
steps:
  - name: internal_design
    agent: architect
    input: user_request
    output: implementation_plan.md
    
  - name: code_generation
    agent: builder
    input: implementation_plan.md
    output: source_code
    
  - name: security_audit
    agent: critic
    input: source_code
    output: audit_report.md
```

**Why this wins**: It is **deterministic**. You get the same quality output every time because the context window is always fresh and focused.
