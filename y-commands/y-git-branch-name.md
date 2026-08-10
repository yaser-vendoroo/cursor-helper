---
description: Create or confirm a task branch name (type/JIRA-key/desc) before checkout — AskQuestion required
---

# Git: branch name (`/y-git-branch-name`)

Port of **`.cursor/rules/y-rules/git/y-git-branch-name.mdc`**. Use when the user needs a **new branch**, wants to **confirm a branch name**, or before `git checkout -b`.

**Do not** run `git checkout -b` or create a branch until the user confirms the name via **`AskQuestion`**.

---

## Format

```text
<type>/<jira-issue-key>-<short-description>
```

| Prefix | Use |
|--------|-----|
| `feature/` | New features or enhancements |
| `bugfix/` | Bug fixes |
| `hotfix/` | Urgent production fixes |
| `chore/` | Maintenance (deps, config, etc.) |

## Rules

- **Always** include the tracker issue key when your team uses one (e.g. `PROJ-123`, `VAP-2325`).
- Use **kebab-case** for the short description.
- Be specific: e.g. `bugfix/PROJ-123-fix-overflow-routing` not `bugfix/PROJ-123-fix`.

Follow your repo’s **CONTRIBUTING.md** when it defines branch naming.

---

## Workflow

1. **Infer** `<type>`, issue key, and description from the task, branch context, or user message.
2. **Propose** a full branch name in the format above.
3. **`AskQuestion`** — include:
   - The proposed name (recommended)
   - Sensible alternatives (different `<type>` or shorter description)
   - Switch to an **existing branch** if applicable
   - **`other`** for a custom name
4. **Wait** for the user's answer.
5. **Only after confirmation:**
   - New branch: `git checkout -b <confirmed-name>`
   - Existing branch: `git checkout <confirmed-name>`

If the user already gave an exact branch name in the same message, still confirm via **`AskQuestion`** unless they explicitly said to use that name without asking.

---

## Examples (good)

- `feature/PROJ-123-add-user-auth`
- `bugfix/VAP-2325-resiroo-followup-language`
- `hotfix/PROJ-789-patch-api-security`

## Examples (bad)

- `fix-bug`, `new-feature`, `test`, branches without an issue key when your team requires one.

---

## Do not

- Create or switch branches without **`AskQuestion`** confirmation.
- Use vague descriptions (`fix`, `update`, `wip`).
