---
description: Fibonacci story-point estimate (Dev, QA, or both) for an existing Jira ticket (1–8); requires key or URL
---

# Team: task estimate (`/y-team-task-estimate`)

Read and follow **`.cursor/rules/y-rules/team/y-team-task-estimate.mdc`** end-to-end.

## Mandatory first steps

1. If **AskQuestion** is unavailable: one-line alarm, then the same options in chat.
2. Short intro (scale, not hours, factors, confidence 0–5). Always a Fibonacci number **and** confidence 0–5. Split and spike are recommendations beside the number.
3. **AskQuestion** audience (multi-select, **default both**): **Dev team** / **QA team**.
4. Require a **Jira key or browse URL** — stop until provided.
5. Gather ticket + links (**Blocked by** vs **Requires in Production**). Related repos when Dev is selected; QA-only glances at blast radius and test docs, not a deep implement review.
6. Score **confidence 0–5** per audience — **always** a Fibonacci number too, even when confidence is low (vague tickets still get a number). Do not inflate SP from confidence.
7. Recommend **Estimate** `1 2 3 5 8` + **Confidence N/5** per audience; write `cursor_workspace/estimation-<ticket-code>.md`; **AskQuestion** to confirm, then optional Jira write:
   - **Dev:** Story Point estimate + `y-ai-estimated`, `y-ai-est-confidence-<n>`, `y-ai-needs-refinement` when Dev confidence is 0–2
   - **QA:** QA Story Point + `y-ai-qa-storypoint`, `y-ai-qa-sp-confidence-<n>`, `y-ai-qa-needs-refinement` when QA confidence is 0–2
   - **QA-only** must not overwrite Dev points or Dev labels. **Dev-only** must not overwrite QA field or `y-ai-qa-*` labels.
   - **Never delete non-`y-ai-*` labels.** Read current labels first, then send the merged list.

Pair with **`.cursor/rules/y-rules/team/y-team-task-refinement.mdc`** when the ticket itself is still vague.
