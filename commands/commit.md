---
description: Generates a structured commit message with bullet points
---

Analyze the staged changes and generate a professional commit message following the Conventional Commits specification.

**Format Requirements:**

1. **Subject Line:** Concise and imperative (e.g., `refactor: ...`).
2. **Body:**
    * Start with a brief summary sentence of the change.
    * **Crucial:** Use a bulleted list (`-`) for the specific technical changes (e.g., "Split X into Y", "Extract Z helper").
    * End with a short sentence explaining the impact or motivation (e.g., "This reduces duplication...").

Output the final message in a single code block for easy copying.
