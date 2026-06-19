---
description: Senior code review of unpushed commits only — read-only, no edits or push
---

# Git: code review (`/y-git-code-review`)

Port of **`.cursor/y-rules/git/y-git-code-review.mdc`**. Use when the user asks for a **code review** of their git work.

For a **markdown report file** (blocking/follow-ups), also follow **`.cursor/y-rules/cursor/y-cur-code-review.mdc`** when installed.

Act as a **senior software engineer**. Assess the work **only** from Git history.

---

## Hard limits

- **Review only** commits that exist **locally** but are **not yet on remote `origin`** (unpushed commits).
- **Do not** review **uncommitted** work: no staged, unstaged, or untracked files in scope.
- **Do not** change the codebase: **no edits**, **no fixes**, **no commits**, **no push**. Output is **review text only** (unless the user clearly asks for separate changes in the same session).

---

## Find commits to review

Run in parallel where useful:

```bash
git branch --show-current
git status --short
git log @{upstream}..HEAD --oneline
```

1. Prefer: `git log @{upstream}..HEAD` when upstream is set and tracks `origin/...`.
2. If upstream is not set: `git log origin/$(git branch --show-current)..HEAD` **only if** `origin/<current-branch>` exists (fetch first if needed).
3. If you **cannot** determine a fair comparison to **origin**, say so briefly — **do not** fall back to reviewing uncommitted diffs.

Review the **combined diff** of those commits (`git diff @{upstream}..HEAD` or per-commit `git show`), not the whole repository.

---

## What to check (prioritize by risk)

- **Correctness & edge cases** — happy path, null/empty inputs, error paths, concurrency/async if relevant
- **Fit with the codebase** — naming, patterns, imports, project conventions
- **Scope** — unrelated refactors or drive-by changes
- **Tests & regressions** — coverage gaps, broken tests
- **Security & safety** — secrets, injection, authz, PII/logging, unsafe defaults
- **Operability** — logging, metrics, config, migrations, backward compatibility
- **Docs & API contracts** — public behavior or integrations needing updates

---

## Output style

- **English at CEFR B2** — clear, short sentences, professional tone.
- Be **direct**: blocking issues vs nits vs suggestions.
- Point to **files/lines** when possible.
- If everything looks good, say so briefly and note **residual risks** or follow-ups.

Do **not** block on style nits when behavior is correct and consistent with surrounding code.

---

## Optional pre-check (`AskQuestion`)

If `git status` shows uncommitted changes, use **`AskQuestion`**:

| Option | Meaning |
|--------|---------|
| **Review unpushed commits only** | Default — ignore working tree |
| **Stop — I will commit first** | End review; user commits then re-runs |
| **`other`** | User explains different intent |

---

## Do not

- Review uncommitted diffs as a substitute when unpushed-commit scope cannot be determined.
- Fix code, commit, or push as part of this command.
