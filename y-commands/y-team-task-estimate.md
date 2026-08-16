---
description: Fibonacci story-point estimate for an existing Jira ticket (1–8); requires key or URL
---

# Team: task estimate (`/y-team-task-estimate`)

Read and follow **`.cursor/rules/y-rules/team/y-team-task-estimate.mdc`** end-to-end.

## Mandatory first steps

1. If **AskQuestion** is unavailable: one-line alarm, then the same options in chat.
2. Short intro (scale, not hours, factors, AI-era, split/spike, related code).
3. Require a **Jira key or browse URL** — stop until provided.
4. Gather ticket + related repos; ask if a needed repo is not accessible.
5. Recommend `1|2|3|5|8` plus **Checked / considered** and **Why** in chat; write `cursor_workspace/estimation-<ticket-code>.md` from the rule template (headings, factors line, onboarding); **AskQuestion** to confirm, then optional Jira write.

Pair with **`.cursor/rules/y-rules/team/y-team-task-refinement.mdc`** when the ticket itself is still vague.
