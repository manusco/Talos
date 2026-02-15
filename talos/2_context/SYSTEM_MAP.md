# System Map (The Atlas)

> **"Where is everything?"**
> *This is a TEMPLATE. Replace the examples with your actual infrastructure.*

## 1. Data Cartography

| Data Type | Source of Truth | Access Method | Risk Level |
| :--- | :--- | :--- | :--- |
| **[Core Entity, e.g. Users]** | [e.g. Supabase `auth.users`] | [e.g. SDK / API] | [HIGH/LOW] |
| **[Financials]** | [e.g. Stripe, QuickBooks] | [API / Export] | CRITICAL |
| **[Code]** | [e.g. GitHub `org/repo`] | `git` | MEDIUM |
| **[Telemetry]** | [e.g. Datadog, CloudWatch] | [SDK] | LOW |

## 2. Tool Registry

| Tool | Purpose | Owner Skill |
| :--- | :--- | :--- |
| **[Workflow Tool]** | [e.g. Deterministic Workflows (n8n)] | `engineering/automation` |
| **[Research Tool]** | [e.g. Perplexity] | `strategy/research` |
| **[Creative Tool]** | [e.g. Midjourney] | `design/studio` |

## 3. Infrastructure Map
*   **Protection**: [e.g. Cloudflare / WAF]
*   **Compute**: [e.g. AWS EC2 / Vercel / Kubernetes]
*   **Storage**: [e.g. AWS S3 / Blob Storage]

## 4. Internal Subsystems (The Components)
*Define the major logical components of the application.*

| Module | Responsibility | Input | Output | Dependencies |
| :--- | :--- | :--- | :--- | :--- |
| **[Module Name]** | [What it does] | [Data In] | [Data Out] | [Other Modules] |

## 5. Key Workflows (The Critical Paths)
*Trace the most critical paths through the system.*

1.  **[Workflow Name]** (e.g., "User Signup")
    - Step 1: User submits form
    - Step 2: API validates input
    - Step 3: DB creates record
    - Step 4: Email service sends welcome
