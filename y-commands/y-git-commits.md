---
description: Analyze uncommitted changes, propose grouped Conventional Commits, commit after AskQuestion approval
---

# Git: commits (`/y-git-commits`)

Port of **`.cursor/rules/y-rules/git/y-git-commits.mdc`**.

**Read and follow [`.cursor/rules/y-rules/git/y-git-commits.mdc`](../y-rules/git/y-git-commits.mdc) end-to-end** for every phase, gate, grouping rule, and pitfall. This command is the entry point; the rule file is the full specification.

---

## When to use

| Situation | Use |
|-----------|-----|
| Mixed uncommitted changes that should be **one or more** logical commits | **`/y-git-commits`** |
| Single staged slice; message draft or amend only | [`/y-git-commit-message`](y-git-commit-message.md) |
| New `??` files before committing | [`/y-git-track-new-files`](y-git-track-new-files.md) (may run first inside this flow) |

---

## Mandatory first steps

1. Run **Phase 1** context commands from **y-git-commits.mdc** in parallel.
2. If **`??` untracked files** exist, **`AskQuestion`** per track-new-files options **before** presenting a commit plan.
3. Analyze and group per **Phase 3** — present the plan table and draft messages.
4. **`AskQuestion`** — commit plan gate. **Do not** commit until the user approves.

---

## Also apply when relevant

| Related rule / command | When |
|------------------------|------|
| [y-git-commit-message.md](y-git-commit-message.md) | Message format (subject, body, `Refs` footer) for each proposed commit |
| [y-git-track-new-files.md](y-git-track-new-files.md) | Untracked files before analysis |
| [y-git-create-pr.md](y-git-create-pr.md) | Optional follow-up after commits |
| [y-git-branch-name.mdc](../y-rules/git/y-git-branch-name.mdc) | Issue key from branch name for commit scope |

---

## Global rules

- Use **`AskQuestion`** at every gate defined in **y-git-commits.mdc** — no chat-only confirmation.
- Create a **backup ref** (`refs/backup/pre-y-git-commits-*`) before the first `git add`.
- Stage **named paths only** — never `git add -A`.
- **Do not** rewrite unpushed commit history in this flow.
- **Do not** push or open a PR without a follow-up **`AskQuestion`**.

---

## Quick reference

| Phase | Action |
|-------|--------|
| 1 | Gather `git status`, diffs, branch, log |
| 2 | Preconditions — empty tree stops; handle `??` via AskQuestion |
| 3 | Analyze and group into commit slices |
| 4 | Present plan + **`AskQuestion`** |
| 5 | Safety snapshot (`git stash create` + `update-ref`) |
| 6 | Sequential `git add` + `git commit` per slice |
| 7 | Handoff + optional push/PR **`AskQuestion`** |

For grouping heuristics, ambiguous hunks, and the full Do-not list — see **y-git-commits.mdc**.
