# n8n Automation: The Deterministic Engine

> **"Let the Agent think. Let n8n do."**

This guide details the **Hybrid Intelligence** pattern: using OpenClaw for reasoning and n8n for execution.

## The Core Philosophy

LLMs are prone to hallucination when executing complex, multi-step API chains. n8n is a visual workflow automation tool that is **deterministic**. It never hallucinates.

** The Pattern:**
1.  **Agent (Planner)**: Decides *what* needs to be done.
2.  **n8n (Executor)**: Performs the actual API calls, database operations, and data transformation.
3.  **Agent (Analyst)**: Consumes the clean output from n8n.

## The Bridge: n8n MCP Server

To make this work, your agent needs to "see" n8n. We use the **n8n-mcp** server.

### What it enables
*   **Search Nodes**: The agent can find the right tool for the job.
*   **Generate Workflows**: The agent can *write* JSON for n8n workflows.
*   **Validate**: The agent can check if a workflow is valid before running it.

## Best Practices

### 1. "Vibe Coding" with n8n
Don't write n8n JSON manually. It's painful.
**Ask the Agent**: "Build an n8n workflow that watches Gmail for invoices and uploads them to Dropbox."
The agent (equipped with `n8n-skills`) will generate the correct JSON. You just paste it into n8n.

### 2. Complex Actions -> Webhooks
If an agent needs to do something complex (e.g., "Scrape this site, summarize it, and save to Notion"), **don't** let the agent do it step-by-step.
*   **Build an n8n workflow** that does: `Webhook -> Scraper -> Summarizer -> Notion`.
*   **Give the Agent a Tool**: "Call `https://n8n.your-domain.com/webhook/scrape`".
*   *Result*: 100% reliability, 0% hallucination.

### 3. Git-Backed Intelligence
Store your n8n workflow JSONs in your git repo.
*   **Benefit**: The agent can "read" its own tools.
*   **Benefit**: Version control for your automation.
