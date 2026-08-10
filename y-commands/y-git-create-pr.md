---
description: Create a Task PR (→ testing), Hotfix PR (→ production), or Release PR (→ production)
---

# Git: create PR (`/y-git-create-pr`)

Port of **`.cursor/rules/y-rules/git/y-git-create-pr.mdc`**.

**Read and follow [`.cursor/rules/y-rules/git/y-git-create-pr.mdc`](../y-rules/git/y-git-create-pr.mdc) end-to-end** for every step, gate, template, and pitfall. This command is the entry point; the rule file is the full specification.

---

## Mandatory first step

Before any fetch, branch work, or `gh pr create`, use **`AskQuestion`**:

| Option | Path |
|--------|------|
| **Task PR** | `<type>/<JIRA>-<desc>` → `testing` |
| **Hotfix PR** | `prod-<JIRA>` → `production` |
| **Release PR** | `release-<version>` → `production` |

Wait for the user's answer. **Do not** infer from branch name alone unless they already stated the type in the same message.

After the choice, follow **only** the matching section in **y-git-create-pr.mdc**.

---

## Also apply when relevant

| Related rule / command | When |
|------------------------|------|
| [y-git-branch-name.mdc](../y-rules/git/y-git-branch-name.mdc) or `/y-git-branch-name` | Task PR branch naming |
| [y-git-track-new-files.mdc](../y-rules/git/y-git-track-new-files.mdc) or `/y-git-track-new-files` | New task files still untracked |
| `.cursor/rules/y-generative-search-rules/slack/y-slack-pr-ready-for-review.mdc` | Task PR — optional Slack after create |
| [`y-agt-gc-meet-helper.mdc`](../y-rules/agent/y-agt-gc-meet-helper.mdc) | Task PR — Calendar step before Slack |

---

## Global rules (all PR paths)

- Use **`AskQuestion`** at every confirmation gate defined in **y-git-create-pr.mdc**.
- Show **PR title** and **full PR body** in fenced code blocks **before** approve/edit questions.
- **Do not** run `gh pr create` without **final approval**.
- **Do not** commit or push local uncommitted work unless the user explicitly asks.
- **Do not** skip checklist **`AskQuestion`** boxes (Required + Optional).

---

## Quick reference

| | Task PR | Hotfix PR | Release PR |
|---|---------|-----------|------------|
| **Base** | `testing` | `production` | `production` |
| **Source branch** | `feature/`, `bugfix/`, etc. | `prod-<JIRA>` | `release-<version>` |
| **Title** | `fix(VAP-123): short desc` | `fix(VAP-0000): VAP-1 VAP-2` | `feat(VAP-0000): VAP-1 VAP-2` |

For git steps, checklists, Deployment Notes, cherry-pick order, stash restore, Calendar, and Slack — see **y-git-create-pr.mdc**.
