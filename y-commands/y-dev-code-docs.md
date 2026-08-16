---
description: Gated docstring and comment pass — scope, intent, depth; fill gaps, revise, or clean
---

# Code documentation (`/y-dev-code-docs`)

**Read and follow [`y-rules/dev/y-dev-code-docs.mdc`](../y-rules/dev/y-dev-code-docs.mdc) end-to-end** — standards plus the **When the user asks to document code** workflow.

This command is the entry point; the rule is the full specification.

---

## When to use

| Situation | Use |
|-----------|-----|
| Add or improve docstrings and comments on a chosen scope | **`/y-dev-code-docs`** |
| Fill documentation gaps after a task | **`/y-dev-code-docs`** |
| Revise noisy or redundant existing docs | **`/y-dev-code-docs`** |

---

## Mandatory first step

Read and follow **`y-rules/dev/y-dev-code-docs.mdc`** — do not duplicate its workflow, gates, or standards here.

---

## Also apply when relevant

| Related rule | When |
|--------------|------|
| [`y-agt-debug-comments.mdc`](../y-rules/agent/y-agt-debug-comments.mdc) | Preserve debug and investigation comments unless removal is explicitly confirmed |
| [`y-git-commits.mdc`](../y-rules/git/y-git-commits.mdc) | User wants to commit doc changes afterward |

---

## Global rules

- Use **`AskQuestion`** at every gate defined in **`y-dev-code-docs.mdc`** (scope, large-scope confirmation, **docstring style**, intent, depth, removal confirm). Casual Python edits stay **Google** with no style question.
- **Do not** auto-commit. **Verbose walkthrough** output is temp-only — not commit-ready unless the user asks separately.
