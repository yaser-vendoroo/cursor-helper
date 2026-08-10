---
description: Stage new task-related files so nothing important stays untracked before handoff
---

# Git: track new files (`/y-git-track-new-files`)

Port of **`.cursor/rules/y-rules/git/y-git-track-new-files.mdc`**. Use during or at the end of implementation when new files were created for the task.

---

## Required behavior

1. Run `git status --short` and list **untracked** (`??`) files related to the current task.
2. If none, report that and stop.
3. If there are candidates, use **`AskQuestion`**:
   - **Stage all task files** (list paths in the prompt)
   - **Stage selected only** — user names paths or excludes local-only files
   - **Skip** — keep untracked; user must state reason in chat
   - **`other`**
4. After confirmation, stage only approved paths:

   ```bash
   git add <path> ...
   ```

5. Re-run `git status --short` and confirm tracked state in the handoff summary.

---

## Scope rules

- Stage **only** files related to the user request.
- **Do not** stage secrets or local-only files (`.env`, credentials, local dumps) unless the user explicitly asks.
- If a file stays untracked on purpose, state that clearly with a short reason.

---

## Optional follow-up (`AskQuestion`)

If staged files are ready to commit and the user may want that next:

| Option | Meaning |
|--------|---------|
| **Plan commits** | Continue with [`/y-git-commits`](y-git-commits.md) when changes span multiple logical commits |
| **Commit now** | Continue with `/y-git-commit-message` workflow (or manual `git commit` with the drafted message) |
| **Stage only** | Stop after `git add` |
| **`other`** | e.g. push, PR — delegate to the matching git command |

---

## Do not

- `git add -A` or stage unrelated files without confirmation.
- Leave task-related `??` files unmentioned at handoff time.
