# Social Automation: The ClawSocial Integration

> **"Give your agent hands to interact with the world."**

We have integrated **ClawSocial** as a sidecar service in the stack. It provides a REST API for Instagram, LinkedIn, and Twitter automation.

## 1. Enabling the Service

The service is defined in `docker-compose.yml` but requires credentials to function.

1.  Open `.env`
2.  Fill in the `INSTAGRAM_*`, `LINKEDIN_*`, or `TWITTER_*` sections.
3.  Restart the stack: `make update`

## 2. Agent Usage (The "Skill")

To let OpenClaw use this, create a skill in your workspace that talks to the `clawsocial` container on port `3847`.

### Example Skill Definition

**Name**: `social_action`
**Description**: "Perform social media actions (like, comment, post). USE WHEN: interacting with IG/LinkedIn/Twitter. DON'T USE WHEN: just reading public web pages."

**Tool Logic (Node/Python)**:
```javascript
// Call the internal Docker service
const baseUrl = "http://clawsocial:3847/api";

// Example: Like an Instagram post
await fetch(`${baseUrl}/instagram/like`, {
  method: "POST",
  body: JSON.stringify({ url: args.url })
});
```

## 3. Safety Limits (Top 1% Practice)

ClawSocial handles rate limits internally, but you should enforce high-level policy:

*   **Warm-up**: Don't mass-follow 100 people on Day 1.
*   **Context**: Use the `SOCIAL_CONTEXT` pattern. Before commenting, read the post content into context, generate a comment, *then* call the tool.
*   **Verification**: After posting, use the Browser skill to verify the post actually appears.
