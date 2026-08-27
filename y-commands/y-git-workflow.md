---
description: Orchestrate legacy vs new git task workflow from branch through QA and production
---

# Git: workflow (`/y-git-workflow`)

Port of **`.cursor/rules/y-rules/git/y-git-workflow.mdc`**.

**Read and follow [`.cursor/rules/y-rules/git/y-git-workflow.mdc`](../y-rules/git/y-git-workflow.mdc) end-to-end** for detection, AskQuestion gates, new path (`VAP-xxxx` + `mg-testing-VAP-xxxx`), legacy Task PR, QA loops, and production handoff. This command is the entry point; the rule file is the full specification.

---

## Mandatory first steps

1. Gather git + Jira + `gh` PR state (see the rule).
2. Infer **legacy vs new**. **`AskQuestion`** for the path **only** when detection is missing or conflicting.
3. Infer the **current step**. **`AskQuestion`** — continue from detected step / pick a different step / stop.
4. Then follow **only** that step (and later steps the user confirms) in **y-git-workflow.mdc**.

Do **not** start `git checkout -b`, `git pull`, `git push`, `gh pr create`, or Jira transitions before the matching gate.

---

## Also apply when relevant

| Related rule / command | When |
|------------------------|------|
| [y-git-branch-name.mdc](../y-rules/git/y-git-branch-name.mdc) or `/y-git-branch-name` | **Legacy** task branch only |
| [y-git-commits.mdc](../y-rules/git/y-git-commits.mdc) or `/y-git-commits` | Commits during implement / rework |
| [y-git-track-new-files.mdc](../y-rules/git/y-git-track-new-files.mdc) or `/y-git-track-new-files` | New task files still untracked |
| [y-git-create-pr.mdc](../y-rules/git/y-git-create-pr.mdc) or `/y-git-create-pr` | Task PR (legacy or `mg-testing-*` exceptions); Release PR / Hotfix PR at N11 |
| `.cursor/rules/y-rules/slack/y-slack-pr-ready-for-review.mdc` | In Review fields; optional Slack after PR |

---

## Quick reference

| Path | Task branch | PR head → base |
|------|-------------|----------------|
| **New** | `VAP-xxxx` from `origin/production` | `mg-testing-VAP-xxxx` → `testing` |
| **Legacy** | `<type>/VAP-xxxx-desc` | same branch → `testing` |

Shared tail after merge: N8 release to testing (manual) → N9 Ready for QA → N9r (QA fail) or N10 Ready for Release → N11 Release PR or Hotfix PR.

**N11 new path:** **`AskQuestion`** cherry-pick source — default **task branch `VAP-xxxx`** (not `mg-testing-*` or `testing`). Then delegate to `y-git-create-pr` with that **`<origin-branch>`**.
