---
description: Pre-plan workflow — Jira context, approach, E2E scope; then CreatePlan per plan guidelines
---

# Plan (`/y-agt-plan`)

**Read and follow [`y-rules/agent/y-agt-plan-phase.mdc`](../y-rules/agent/y-agt-plan-phase.mdc) end-to-end**, then **[`y-rules/agent/y-agt-plan-guidelines.mdc`](../y-rules/agent/y-agt-plan-guidelines.mdc)** for the plan document.

This command is the entry point; **`y-agt-plan-phase`** is the pre-plan workflow; **`y-agt-plan-guidelines`** is the plan file specification.

---

## When to use

| Situation | Use |
|-----------|-----|
| User asks to plan a task, enters plan mode, or needs `CreatePlan` | **`/y-agt-plan`** |
| Plan file structure / versioning only (phase already done) | [`y-agt-plan-guidelines.mdc`](../y-rules/agent/y-agt-plan-guidelines.mdc) directly |

---

## Mandatory first steps

1. Run **`y-agt-plan-phase`** pipeline in order (AskQuestion gates, Jira key, context fetch, clarify, solution approach, guardrails, E2E scope).
2. If **`AskQuestion`** is unavailable, follow the stop/continue gate in the phase rule — do not skip silently.
3. Only after the phase completes: **`CreatePlan`** per **`y-agt-plan-guidelines`**.

---

## Also apply when relevant

| Related rule | When |
|--------------|------|
| [`y-team-task-refinement.mdc`](../y-rules/team/y-team-task-refinement.mdc) | Vague existing ticket (**§ step 4 only**) |
| [`y-agt-task-context.mdc`](../y-rules/agent/y-agt-task-context.mdc) | AC gaps, thin ticket context |
| [`y-dev-rfc.mdc`](../y-rules/dev/y-dev-rfc.mdc) | Thorough approach needs a design RFC before code |
| [`y-git-branch-name.mdc`](../y-rules/git/y-git-branch-name.mdc) | Branch name in plan sub-tasks |
| `y-tst-testing-criteria` → `y-tst-test-cases` → `y-tst-e2e*` → `y-ins-e2e-report` | E2E in this plan (generative-search rules under `y-generative-search/`) |
| [`y-git-create-pr.mdc`](../y-rules/git/y-git-create-pr.mdc) | Post-implementation PR + Local Tests Report (not planning) |
| [`y-agt-workspace.mdc`](../y-rules/agent/y-agt-workspace.mdc) | Plan path `.cursor/plans/` vs `cursor_workspace/` |

---

## Global rules

- Use **`AskQuestion`** at every gate in **`y-agt-plan-phase`** — no chat-only confirmation.
- **Do not** call **`CreatePlan`** before solution approach and E2E scope are resolved or deferred.
- **Do not** duplicate runbooks from **`y-tst-*`** / **`y-ins-*`** rules inside the plan — link them.

For the full pipeline, RFC branch, and Do-not list — see **`y-agt-plan-phase.mdc`**.
