---
description: Senior code review of unpushed commits — read-only; markdown report when needed
---

# Code review (`/y-agt-code-review`)

**Read and follow [`y-rules/agent/y-agt-code-review.mdc`](../y-rules/agent/y-agt-code-review.mdc) end-to-end.**

This command is the entry point; the rule is the full specification.

---

## When to use

| Situation | Use |
|-----------|-----|
| Code review, PR review before push, review local commits | **`/y-agt-code-review`** |

---

## Mandatory first step

Read and follow **`y-rules/agent/y-agt-code-review.mdc`** — do not duplicate its workflow, checklist, or report template here.

---

## Also apply when relevant

| Related rule | When |
|--------------|------|
| [`y-agt-workspace.mdc`](../y-rules/agent/y-agt-workspace.mdc) | Default report path `cursor_workspace/code-review/` |
| [`y-agt-communication-b2-english.mdc`](../y-rules/agent/y-agt-communication-b2-english.mdc) | Review prose (B2 English) |

---

## Global rules

- Use **`AskQuestion`** at the uncommitted-changes gate defined in **`y-agt-code-review.mdc`**.
- **Do not** fix code, commit, or push as part of this command.
- Markdown reports: **`YYYYMMDD-HHMM`** in filename and H1 per **`y-agt-code-review.mdc`** — do not duplicate the template here.
