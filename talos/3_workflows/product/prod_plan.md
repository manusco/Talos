# Plan Workflow

> **Objective**: Create a rigorous, step-by-step implementation plan for a feature or project.
> **Trigger**: User Request or New Roadmap Item.
> **Owner**: Strategy / Engineering Skill.

## 1. Input Schema
*   **Request**: A clear description of the desired outcome.
*   **Context**: Relevant files or constraints (e.g., "Must use React").
*   **Constraint**: `2_context/BUSINESS_LOGIC.md` (Check for prohibited patterns).

## 2. The Flow

### Step 1: Deep Research
*   **Action**: Search the codebase and external docs.
*   **Skill**: `intelligence/research_scientist`
*   **Output**: `research_summary.md` (Key facts, existing patterns).

### Step 2: Specification (Working Backwards)
*   **Action**: Write the "Press Release" or "README" for the finished feature.
*   **Skill**: `product/product_manager`
*   **Output**: `spec.md` (User Story, Acceptance Criteria).

### Step 3: Implementation Planning (The 4-Pass)
*   **Action**: Create the step-by-step execution plan.
*   **Skill**: `engineering/architect`
*   **Output**: `implementation_plan.md` (YAML-structured steps).

## 3. Quality Gate (Definition of Done)
*   [ ] **Completeness**: Does it cover Edge Cases?
*   [ ] **Atomic**: Is every step smaller than 1 hour of work?
*   [ ] **Verification**: Does every step have a verification command?
*   [ ] **Approval**: Has the Human approved the plan?

## 4. Output Artifacts
*   `implementation_plan.md`
*   `spec.md`

## 5. Verification (Golden Set)
*   **Test Case 1**: `tests/plan_feature_request.md` -> `tests/plan_feature_output.md`
