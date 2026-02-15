# Agent Optimization Strategy

> **"SEO was for crawlers. AEO is for agents."**

As agents become the primary way users interact with the web, you must optimize your websites and APIs for agentic consumption. This is the discipline of **AEO**.

## 1. WebMCP: The Front Door for Agents

Traditional browser agents are brittle because they rely on DOM parsing and visual "guessing". **WebMCP** replaces this with structured tool registration.

### The Breakdown
*   **Websites as APIs**: Instead of an agent scraping your site, your site "registers" its tools directly to the agent's context (e.g., `navigator.modelContext`).
*   **Zero Scraping**: Agents call functions with structured arguments and get JSON back.
*   **Existing Auth**: Tools run inside the browser tab, inheriting the user's active session.

## 2. Optimization Surfaces

To attract agent traffic (which is ~51% of the web), optimize these three surfaces:

### A. Tool Naming & Descriptions
*   **Ambiguity is Friction**: `submit_form` is bad. `schedule_competitive_analysis_teardown` is good.
*   **Use Keyword Rich Descriptions**: Agents "search" their tools. Ensure your descriptions contain the keywords agents use to plan.

### B. Schema Clarity
*   **Strict Types**: Use JSON Schema for all arguments.
*   **Acceptance Criteria**: Explicitly define what "success" looks like for a tool call (e.g., "Returns a CID for the generated report").

### C. The "Cheapest Path" Rule
*   Agents optimize for token efficiency and speed.
*   **The Winner**: The site that provides the cleanest, most structured toolset will be the agent's preferred path over a site that requires complex DOM navigation.

## 3. Implementation Checklist

- [ ] **Register Tools**: Expose high-value actions (Booking, Search, Checkout) via WebMCP or a clear API.
- [ ] **AEO Semantic Markup**: Use JSON-LD to describe site Skills in a way agents can parse without visual agents.
- [ ] **Agent-Specific Rate Limits**: Treat agent traffic as a core user base, not just "bots" to be blocked. Give them a dedicated, high-speed path.
