# Build Workflow

> **Objective**: Execute an implementation plan to produce production-ready code.
> **Trigger**: Approved `implementation_plan.md`.
> **Owner**: Engineering Skill.

## 1. Input Schema
*   **Plan**: The `implementation_plan.md` from the Plan Workflow.
*   **Spec**: The `spec.md` defining success.

## 2. The Flow

### Step 1: Test-Driven Setup
*   **Action**: Write the failing test case first.
*   **Skill**: `engineering/qa_engineer`
*   **Output**: `feature.test.ts` (Failing).

### Step 2: Implementation (The Loop)
*   **Action**: Write code to pass the test.
*   **Skill**: `engineering/backend_engineer` (or Frontend/Mobile).
*   **Output**: Source Code.

### Step 3: Refactor
*   **Action**: Clean up the code without changing behavior.
*   **Skill**: `engineering/refactor_engineer`
*   **Output**: Clean Code.

## 3. Quality Gate (Definition of Done)
*   [ ] **Tests**: All tests pass (Green).
*   [ ] **Lint**: No linter errors.
*   [ ] **Types**: No `any` types.
*   [ ] **Coverage**: Test coverage > 80% for new code.

## 4. Output Artifacts
*   Source Code (`.ts`, `.py`, etc.)
*   Test Suite

## 5. Verification (Golden Set)
*   **Test Case 1**: `tests/build_simple_function.md` -> `tests/build_simple_output.md`
