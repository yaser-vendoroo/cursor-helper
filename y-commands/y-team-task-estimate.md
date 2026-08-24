---
description: Fibonacci story-point estimate for an existing Jira ticket (1–8); requires key or URL
---

# Team: task estimate (`/y-team-task-estimate`)

Read and follow **`.cursor/rules/y-rules/team/y-team-task-estimate.mdc`** end-to-end.

## Mandatory first steps

1. If **AskQuestion** is unavailable: one-line alarm, then the same options in chat.
2. Short intro (scale, not hours, factors, AI-era, related code). Always a Fibonacci number **and** confidence 0–5. Split and spike are recommendations beside the number.
3. Require a **Jira key or browse URL** — stop until provided.
4. Gather ticket + related repos; ask if a needed repo is not accessible.
5. Score **confidence 0–5** (step 3b) from ticket clarity, gaps, and context — **always** recommend a Fibonacci number too, even when confidence is low. Do not inflate SP from confidence.
6. Recommend **Estimate** (1 2 3 5 8 only) + **Confidence N/5** + optional **Recommendations** (split / spike / refinement) + drivers + **Checked / considered** and **Why**; write `cursor_workspace/estimation-<ticket-code>.md` (low-accuracy warning in this file, not on Jira); **AskQuestion** to confirm the number, then optional Jira write:
   - Story Point estimate = the **raw** Fibonacci number
   - Labels: **`y-ai-estimated`**, **`y-ai-est-confidence-<n>`** (n = 0–5, e.g. `y-ai-est-confidence-3`), and **`y-ai-needs-refinement`** when confidence is 0–2 or refinement is recommended
   - **Never delete non-`y-ai-*` labels.** Only modify `y-ai-*` labels this rule owns. Read current labels first, then send the merged list.

Pair with **`.cursor/rules/y-rules/team/y-team-task-refinement.mdc`** when the ticket itself is still vague.
