# Skill Development: The "Recipe" Standard

> **"MCP gives Claude the kitchen. Skills give it the recipe."**

Prompt engineering is the past. **Execution Design** is the future. To build production-grade skills, follow the **Professional Skill** specification.

## 1. The SKILL.md Architecture

A skill is not just a prompt. It is a structured directory that packages instructions, code, and assets.

### The Core Structure
```text
skills/
  workflow-name/
    SKILL.md      # The main instruction file (Markdown)
    scripts/      # Executable code (e.g., Python, Bash)
    examples/     # Reference implementations
    resources/    # Templates, assets, or static data
```

## 2. Progressive Disclosure (Context Hygiene)

Do not dump thousands of lines of instructions into the agent's context. Use **Progressive Disclosure** via YAML frontmatter in your `SKILL.md`.

```markdown
---
name: feature_developer
description: System for designing and implementing new features.
---

# Feature Developer Skill
[Direct instructions for the task follow...]
```

*   **Discovery**: The agent only reads the `name` and `description` at start.
*   **Activation**: When the task matches, the full `SKILL.md` is loaded.
*   **Execution**: The agent follows procedural recipes instead of "guessing".

## 3. The "Use When / Don't Use When" Pattern

LLMs are fuzzy matchers. To prevent tool confusion, provide explicit negative constraints in your descriptions.

| Logic | Benefit |
| :--- | :--- |
| **USE WHEN** | "You have local files ready to upload and a domain is configured." |
| **DON'T USE WHEN** | "You need to buy a domain or configure DNS." |

## 4. Evaluation & Quality Control

Professional skills are measured by four clinical metrics:

1.  **Trigger Accuracy**: Does the agent activate the skill only when intended?
2.  **Tool Call Efficiency**: Minimizing redundant steps and token usage.
3.  **Failure Robustness**: How gracefully the skill handles edge cases or script errors.
4.  **Human Alignment (Taste)**: Does the output reflect "Taste" and provide the user with high-quality options?

## 5. Major Patterns

*   **Document & Asset Creation**: Package `.docx` or `.pptx` templates in `assets/`.
*   **Workflow Automation**: Scripts that handle complex API chains or data plumbing.
*   **MCP Enhancement**: Providing the "missing manual" for complex tools via high-level guidance in `SKILL.md`.
