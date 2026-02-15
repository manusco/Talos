# Ship Workflow

> **Objective**: Safely deploy code to production.
> **Trigger**: `Audit Workflow` = Passed.
> **Owner**: DevOps Skill.

## 1. Input Schema
*   **Version**: Semantic Version (e.g., v1.2.0).
*   **Environment**: Staging or Production.

## 2. The Flow

### Step 1: Changelog Generation
*   **Action**: Summarize commits since last release.
*   **Skill**: `product/copywriter`
*   **Output**: `CHANGELOG.md`.

### Step 2: Release Tagging
*   **Action**: Git tag and push.
*   **Skill**: `engineering/devops_engineer`
*   **Output**: Git Release.

### Step 3: Deployment
*   **Action**: Trigger CI/CD pipeline (e.g., GitHub Actions).
*   **Skill**: `engineering/devops_engineer` (via `n8n` or Script).
*   **Output**: Deployed Application.

### Step 4: Live Verification (Smoke Test)
*   **Action**: Verify distinct URLs return 200 OK.
*   **Skill**: `quality/qa_engineer`
*   **Output**: `health_check.log`.

## 3. Quality Gate (Definition of Done)
*   [ ] **Health**: Production is 200 OK.
*   [ ] **Rollback**: Rollback mechanism is confirmed ready.
*   [ ] **Notification**: Team notified via Slack/Discord.

## 4. Output Artifacts
*   Released Software
*   Updated `CHANGELOG.md`

## 5. Verification (Golden Set)
*   **Test Case 1**: `tests/ship_dry_run.md` -> `tests/ship_log_output.md`
