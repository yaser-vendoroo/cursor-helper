---
description: >-
  Conventional commit messages with rationale-focused body (past-tense bullets,
  Refs footer). Optional amend unpushed HEAD and push via AskQuestion.
---

# Git: commit message (`/y-git-commit-message`)

Use when the user asks for a **commit message**, **amend message**, or you are **staging a commit** in this repository.

When uncommitted changes span **multiple independent concerns**, suggest [`/y-git-commits`](y-git-commits.md) first to analyze and group work into separate commits.

Follow **Conventional Commits** for the subject. The body explains **why**, not what changed — the diff already shows that.

---

## Gather context

Run in parallel:

- `git status` — staged, unstaged, and ahead/behind upstream
- `git diff` and `git diff --staged` — infer underlying intent, not a file list
- `git branch --show-current` — extract tracker key from branch name
- `git log --oneline -10` — recent commit style in this repo
- **Unpushed commits:** `git log @{upstream}..HEAD --oneline` when upstream is set; otherwise `git log origin/$(git branch --show-current)..HEAD --oneline` if that ref exists after `git fetch origin`

Infer intent from code, tests, filenames, comments, branch name, tracker key, and conversation context.

---

## Subject line

```
<type>(<scope>): <short description>
```

| Field | Rules |
|-------|--------|
| **type** | `feat`, `fix`, `refactor`, `chore`, `docs`, `style`, `test`, `perf`, `ci`, `build`, `revert` |
| **scope** | Issue key when known (e.g. `PROJ-2752`); otherwise service/module name. Omit if global. |
| **description** | Imperative mood ("Add feature", "Fix validation"). Lowercase. No trailing period. **≤ 72 characters**. |

Avoid generic subjects: "Update code", "Fix issue", "Refactor logic", "Improve implementation".

---

## Body

- Use **bullet points** only (`-`). Never `*`, `•`, or numbered lists.
- Use **past tense** for verbs in bullets ("Fixed …", "Prevented …", "Added …").
- Keep the body **short**: **1–2 bullets** in most cases; **3 only** when the change truly has three distinct motivations.
- **Do not overexplain.** Skip implementation walkthroughs, file names, and edge cases the diff already shows.
- Explain **why** the change exists and **what problem it solves** — not how every line works.
- Do **not** re-describe file-level diffs — git history shows that.
- Mention tests only when they were added/updated **for this change** and the result matters.

**Body template (prefer 1–2 bullets):**

```
- <Primary outcome — problem solved in one line>
- <Optional: one supporting detail only if it clarifies scope or non-obvious impact>
```

Leave **one blank line** between subject, body, and footer.

---

## Footer

```
Refs <ISSUE-KEY> [<RELATED-KEY> ...]
```

- Extract the primary key from the branch name: pattern `[A-Z]+-\d+` (e.g. `bugfix/PROJ-2752-followup` → `PROJ-2752`).
- Add related issue keys when the change explicitly references them.
- Omit the footer when no tracker key is known.

---

## Workflow

1. Analyze **selected/staged changes** and `git diff` — infer underlying intent, not a file list.
2. Pick the correct **type** (`fix` for bugs, `feat` for new behavior, etc.).
3. Write subject + body + footer per sections above.
4. **Show the commit message** to the user (plain text; no markdown code fence required).
5. **Detect git state** after drafting:
   - **Uncommitted work:** staged and/or unstaged changes not yet in a commit.
   - **Unpushed commits:** commits on `HEAD` not on `origin` for the current branch.
6. **`AskQuestion` — amend unpushed commit message?** (skip if there are **no** unpushed commits)

   Options:
   - **Yes, amend HEAD** (recommended when the draft replaces a weak message on the tip commit)
   - **No, keep existing commit message(s)**

   If **Yes:**
   - **Message-only amend (required):** Change **only** the commit message. The amended commit’s **tree must stay identical**.
   - **Pre-flight before amend:**
     1. Record the current tip tree: `git rev-parse HEAD^{tree}`.
     2. Check whether the index differs from `HEAD`: `git diff --cached HEAD --quiet`.
     3. If the index **differs** from `HEAD`, stash staged work or reset index to `HEAD` before amend, then restore staging after.
   - Run `git commit --amend` with the drafted message (HEREDOC). **Do not** use `--no-verify`.
   - **Post-flight:** Confirm `git rev-parse HEAD^{tree}` equals the saved tree hash.
   - Do **not** amend if HEAD was already pushed to remote.

7. **`AskQuestion` — push unpushed commits?** (skip if there are **no** unpushed commits after step 6)

   Options:
   - **Yes, push to origin**
   - **No, keep local only**

   If **Yes:** `git push -u origin HEAD`. Do **not** force-push unless the user explicitly asks.

8. If both questions were skipped and there is uncommitted work, tell the user the message is ready for manual `git commit` (stage first with `git add` as needed).

---

## Example

Branch: `bugfix/PROJ-2752-followup-validation`

```
fix(PROJ-2752): prevent duplicate requests on follow-up context capture

- Stopped follow-up factual turns from submitting duplicate requests when quoted_messages matched on mixed-intent threads
- Validated with smoke tests for regression cases 001–005

Refs PROJ-2752
```

---

## Do not

- List every modified file in the body.
- Use present tense in body bullets.
- Exceed 72 characters on the subject line.
- Amend or push without **`AskQuestion`** confirmation.
- **Change commit contents** when amending — message only.
- Force-push to `main` / `master` without an explicit user request and a warning.
