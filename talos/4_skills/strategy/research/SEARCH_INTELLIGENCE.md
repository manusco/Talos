# Search Intelligence: Beyond Basic Keywords

> **"Brave Search is for facts. Exa is for research. Perplexity is for answers."**

OpenClaw defaults to Brave Search. For a Top 1% Agent, you need specialized tools.

## 1. The Search Hierarchy

| Provider | Use Case | Cost |
| :--- | :--- | :--- |
| **Brave** | Quick facts, navigational queries, verifying links. | Free / Cheap |
| **Perplexity** | "Answer this question" (synthesized). | Moderate |
| **Exa.ai** | Deep research, finding similar companies, "neural" search. | Moderate |

## 2. Setting Up Perplexity (The "Sonar Pro" Fix)

Perplexity is built-in, but there is a common configuration trap.

1.  Get API Key: [perplexity.ai/settings/api](https://www.perplexity.ai/settings/api)
2.  Edit `config`: `openclaw configure --section web`
3.  **CRITICAL FIX**: Set the model to `sonar-pro`, NOT `perplexity/sonar-pro`.
    *   *Why*: The default string format is for OpenRouter. Direct Perplexity API rejects it.

```json
"tools": {
  "web": {
    "search": {
      "provider": "perplexity",
      "perplexity": {
        "apiKey": "pplx-...",
        "model": "sonar-pro"
      }
    }
  }
}
```

## 3. Integrating Exa.ai (Neural Search)

Exa is not built-in. Use a Skill.

**Skill Definition (`SKILL.md`)**:
```markdown
name: exa_search
description: "Neural web search. USE WHEN: researching complex topics, finding 'companies like X', or when keyword search fails. DON'T USE WHEN: looking up a specific URL."
```

**Implementation (Node.js)**:
Use the official `exa-js` library.
```javascript
const Exa = require("exa-js");
const exa = new Exa(process.env.EXA_API_KEY);

// Neural search
const result = await exa.searchAndContents(args.query, {
  type: "neural",
  useAutoprompt: true,
  numResults: 3
});
```
