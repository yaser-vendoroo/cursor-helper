---
description: Engineering review of ticket local changes, a PR, or a custom scope — read-only; six 1–10 scores; always writes a report
---

# Engineering review (`/y-dev-engineering`)

**Read and follow [`y-rules/dev/y-dev-engineering.mdc`](../y-rules/dev/y-dev-engineering.mdc)** — run its **Standalone review** section end-to-end.

This command is the entry point; the rule is the full specification.

---

## When to use

| Situation | Use |
|-----------|-----|
| Review a ticket's local changes (branch commits plus uncommitted work) | **`/y-dev-engineering`** |
| Review a GitHub PR | **`/y-dev-engineering`** |
| Review a custom scope (paths, commit range, branch compare) | **`/y-dev-engineering`** |
| Review only unpushed commits with the classic workflow | [`/y-agt-code-review`](y-agt-code-review.md) |

---

## Mandatory first step

Read and follow **`y-rules/dev/y-dev-engineering.mdc`** — do not duplicate its scope gates, scores, or report template here.

---

## Also apply when relevant

| Related rule | When |
|--------------|------|
| [`y-agt-workspace.mdc`](../y-rules/agent/y-agt-workspace.mdc) | Report path `cursor_workspace/engineering-review/` |
| [`y-agt-communication-b2-english.mdc`](../y-rules/agent/y-agt-communication-b2-english.mdc) | Review prose (B2 English) |

---

## Global rules

- Use **`AskQuestion`** for the scope gate and every confirmation in the rule.
- **Read-only:** do not fix code, commit, push, post PR comments, approve, or check out branches.
- **Always** write the report, even when the review looks good.
