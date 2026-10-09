---
description: Code review of unpushed commits — pick review, plain-language change walkthrough, or both; read-only; markdown report
---

# Code review (`/y-agt-code-review`)

**Read and follow [`y-rules/agent/y-agt-code-review.mdc`](../y-rules/agent/y-agt-code-review.mdc) end-to-end.**

This command is the entry point; the rule is the full specification.

---

## When to use

| Situation | Use |
|-----------|-----|
| Code review, PR review before push, review local commits | **`/y-agt-code-review`** → **Review** |
| Understand what changed and why (AI or teammate changes), one change at a time | **`/y-agt-code-review`** → **Explain changes** |

---

## Mandatory first step

Read and follow **`y-rules/agent/y-agt-code-review.mdc`** — do not duplicate its workflow, checklist, or report template here.

---

## Also apply when relevant

| Related rule | When |
|--------------|------|
| [`y-dev-engineering.mdc`](../y-rules/dev/y-dev-engineering.mdc) | Design bar and the six review scores; use `/y-dev-engineering` for ticket changes, PRs, or custom scopes |
| [`y-agt-workspace.mdc`](../y-rules/agent/y-agt-workspace.mdc) | Default report path `cursor_workspace/code-review/` |
| [`y-agt-communication-b2-english.mdc`](../y-rules/agent/y-agt-communication-b2-english.mdc) | Review prose (B2 English) |

---

## Global rules

- Use **`AskQuestion`** at the outcome gate (Review / Explain changes / Both) and the uncommitted-changes gate defined in **`y-agt-code-review.mdc`**.
- **Do not** fix code, commit, or push as part of this command.
- Markdown reports: **`YYYYMMDD-HHMM`** in filename and H1 per **`y-agt-code-review.mdc`** — do not duplicate the template here.
