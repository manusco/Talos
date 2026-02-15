# Audit Workflow

> **Objective**: Verify the health, security, and quality of the system.
> **Trigger**: Weekly Schedule OR Pre-Release Gate.
> **Owner**: Quality Skill.

## 1. Input Schema
*   **Scope**: Entire Repo or Specific Folder.
*   **Depth**: "Quick Audit" or "Deep Audit" (Pen Test).

## 2. The Flow

### Step 1: Security Scan (IronClaw)
*   **Action**: Scan for secrets, vulnerabilities, and bad patterns.
*   **Skill**: `quality/security_auditor`
*   **Output**: `security_report.md`.

### Step 2: Code Quality Scan
*   **Action**: Check cyclomatic complexity and anti-patterns.
*   **Skill**: `quality/code_reviewer`
*   **Output**: `quality_report.md`.

### Step 3: Performance Scan
*   **Action**: Check bundle size, query performance.
*   **Skill**: `quality/performance_engineer`
*   **Output**: `perf_report.md`.

## 3. Quality Gate (Definition of Done)
*   [ ] **Crucial Issues**: Zero Critical/High severity issues found.
*   [ ] **Report**: A consolidated `FINAL_AUDIT.md` is generated.
*   [ ] **Action Items**: All findings have Jira/Linear tickets created.

## 4. Output Artifacts
*   `FINAL_AUDIT.md`

## 5. Verification (Golden Set)
*   **Test Case 1**: `tests/audit_vulnerable_code.md` -> `tests/audit_report_detected.md`
