---
description: Unreleased-work risk — testing branch and open PRs vs this ticket; confidence and risk 0–5
---

# Ticket risks (`/y-agt-ticket-risks`)

Read and follow **`.cursor/rules/y-rules/agent/y-agt-ticket-risks.mdc`** end-to-end.

After a plan exists, planning also runs this check (**`y-agt-plan-phase`** step 15). Use this command to **re-run** without re-planning.

## Mandatory first steps

1. If **AskQuestion** is unavailable: one-line note, then the same add-section options in chat (when a plan exists).
2. Fetch `origin/production` and `origin/testing`; list open PRs with `gh` (exclude this ticket’s PR; include drafts).
3. Score factor A (dependency) and factor B (override); report **confidence** and **risk** 0–5. **Warn only — do not block.**
4. **AskQuestion** whether to add **`## Unreleased work risks`** to the current plan (default **Yes**). Skip if there is no plan.
