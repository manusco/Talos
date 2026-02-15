# Operational Guardrails

> **"Safety is not a feature; it is a constraint."**

## 1. Circuit Breakers (Automatic Kill-Switches)
*   **Recall Loop**: If an Agent repeats the same tool call 3 times -> **STOP**.
*   **Cost Velocity**: If > $10.00 spent in 10 minutes -> **STOP**.
*   **Context Explosion**: If Context > 120k Tokens -> **Summarize & Reset**.

## 2. Redaction Rules (Privacy)
*   **PII**: Never log Email, Phone, or IP Address to LLM context unless strictly required for the specific task.
*   **Secrets**: Never output environment variables (`process.env`) to stdout.

## 3. Human-in-the-Loop Triggers (The Gates)
*   **Deployments**: ALWAYS require Human Approval.
*   **Financials**: Spending > $50.00 requires Human Approval.
*   **Deletions**: `rm -rf` or `DROP TABLE` requires Human Approval.
