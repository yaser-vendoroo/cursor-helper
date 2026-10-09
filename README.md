# Cursor Helper

My day-to-day **Cursor rules and slash commands**, centralized in one repo so Vendoroo teammates can use them too. I keep them up to date as workflows evolve — you may find them useful for your work.

**Version:** 2.0.0 — see [CHANGELOG.md](CHANGELOG.md).

## Install in your project

Symlink (recommended) or copy from this repo into your project's `.cursor/` directory. **Keep the `y-*` folder names** so paths in rules and commands resolve correctly.

**Do not replace** your existing `.cursor/rules/` or `.cursor/commands/` folders. Most projects already have their own rules and commands — add these alongside them.

| From this repo | Symlink or folder in your project |
|----------------|-----------------------------------|
| `y-rules/` | `.cursor/rules/y-rules` |
| `y-commands/` | `.cursor/commands/y-commands` |
| `y-vencom/y-vencom-rules/` | `.cursor/rules/y-vencom-rules` (VenCom / VendorCOM only) |
| `y-vencom/y-vencom-commands/` | `.cursor/commands/y-vencom-commands` (VenCom / VendorCOM only) |
| `y-generative-search/y-generative-search-rules/` | `.cursor/rules/y-generative-search-rules` (generative-search only) |
| `y-generative-search/y-generative-search-commands/` | `.cursor/commands/y-generative-search-commands` (generative-search only) |

Example (set `CURSOR_HELPER` to your clone path):

```bash
CURSOR_HELPER=~/dev/vendoroo/side-projects/cursor-helper
cd your-project
ln -s "$CURSOR_HELPER/y-rules" .cursor/rules/y-rules
ln -s "$CURSOR_HELPER/y-commands" .cursor/commands/y-commands
# VenCom / VendorCOM only:
ln -s "$CURSOR_HELPER/y-vencom/y-vencom-rules" .cursor/rules/y-vencom-rules
ln -s "$CURSOR_HELPER/y-vencom/y-vencom-commands" .cursor/commands/y-vencom-commands
# generative-search only:
ln -s "$CURSOR_HELPER/y-generative-search/y-generative-search-rules" .cursor/rules/y-generative-search-rules
ln -s "$CURSOR_HELPER/y-generative-search/y-generative-search-commands" .cursor/commands/y-generative-search-commands
```

### Path conventions in rules

Cross-references in `y-*` files use the **installed** layout:

- Shared rules: `.cursor/rules/y-rules/...` or shorthand `y-rules/...`
- VenCom rules: `.cursor/rules/y-vencom-rules/...` or `y-vencom-rules/...`
- Generative-search rules: `.cursor/rules/y-generative-search-rules/...` or `y-generative-search-rules/...`
- Commands: `.cursor/commands/y-commands/...`

Do **not** use `.cursor/y-rules/`, `.cursor/y-commands/`, `.cursor/y-vencom/...`, or `.cursor/y-generative-search/...` — those paths do not exist in consumer projects.

Reload Cursor after adding files. Some workflows expect `git`, `gh`, and MCP tools (Jira, Slack, Google Calendar).

## Layout

```
y-commands/                              # Common commands — useful in most projects
y-rules/                                 # Common rules — same scope as y-commands
y-vencom/
  y-vencom-commands/                     # VendorCOM commands
  y-vencom-rules/                        # VendorCOM rules
y-generative-search/
  y-generative-search-commands/          # generative-search commands
  y-generative-search-rules/             # generative-search rules
```

Each command (`.md`) is a slash-command entry point. Each rule (`.mdc`) holds the full workflow. Commands point to their matching rule; other rules apply via `@` reference or `alwaysApply`.

---

## `y-commands/`

Common slash commands — useful in most projects. Install as `.cursor/commands/y-commands`.

| Command | Description |
|---------|-------------|
| `/y-git-commits` | Analyze uncommitted changes; propose grouped Conventional Commits; commit after AskQuestion approval |
| `/y-git-commit-message` | Draft Conventional Commit messages; optional amend unpushed HEAD and push |
| `/y-git-create-pr` | Create a task PR (→ testing), hotfix PR (→ production), or release PR (→ production) |
| `/y-git-workflow` | Orchestrate legacy vs new task git flow from branch through QA and production |
| `/y-agt-code-review` | Code review of unpushed commits — pick review (verdict and scores), plain-language change walkthrough, or both; read-only |
| `/y-git-branch-name` | Create or confirm a task branch name before checkout |
| `/y-git-track-new-files` | Stage new task-related files so nothing important stays untracked |
| `/y-agt-plan` | Pre-plan workflow, then Cursor vs Rules plan approach, optional diagrams, CreatePlan, then ticket unreleased-work risks |
| `/y-agt-ticket-risks` | Unreleased-work risk vs `testing` and open PRs; confidence and risk 0–5 (also runs after `/y-agt-plan`) |
| `/y-dev-code-docs` | Gated docstring/comment pass on a chosen scope (fill gaps, revise, clean) |
| `/y-dev-engineering` | Engineering review of ticket local changes, a PR, or a custom scope — read-only; six 1–10 scores; always writes a report |
| `/y-tst-testing-criteria` | Testing criteria doc for tech/QA sign-off |
| `/y-tst-test-cases` | Test-cases document structure for a work item |
| `/y-tst-test-case` | Single reusable test case format (`TST-AREA-NNN`) |
| `/y-tst-unit-of-code` | Manual unit/class verification via Docker Compose |
| `/y-ins-e2e-report` | Final markdown report structure for E2E runs (Detailed, Compact, QA Test Samples) |
| `/y-slack-pr-ready-for-review` | Slack PR-ready — choose a team channel, confirmation gate, Jira checks |
| `/y-team-task-estimate` | Fibonacci story-point estimate for an existing Jira ticket (1–8); Dev, QA, or both |

---

## `y-rules/`

Common rules — same scope as `y-commands/`. Install as `.cursor/rules/y-rules`.

### Agent (`y-agt-*`)

| Rule | Description |
|------|-------------|
| `y-agt-plan-phase` | Pre-plan before CreatePlan — ticket, approach, E2E scope, guardrails, Ruff and code-docs todos, plan style, diagrams; then **y-agt-ticket-risks** |
| `y-agt-plan-guidelines` | Plan versioning, Goals, Out of scope; Cursor path (flexible) or Rules path (full structure) |
| `y-agt-ticket-risks` | After a plan exists — dependency/override vs unreleased `testing` work and open PRs; confidence and risk 0–5 |
| `y-agt-workspace` | Default output paths — `cursor_workspace/` defaults; plans use Cursor Plan mode (not `cursor_workspace/`) |
| `y-agt-code-review` | Unpushed-commit review workflow, AskQuestion gates; outcome is review, change walkthrough, or both |
| `y-agt-gc-meet-helper` | Google Calendar PR review — generate handoff or create draft event |
| `y-agt-communication-b2-english` | B2 English replies — clear, complete, professional |
| `y-agt-debug-comments` | Preserve user debug comments unless asked to remove them |
| `y-agt-diffs` | Task-related unified diffs for handoff docs (Confluence, Jira, etc.) |
| `y-agt-task-context` | Acceptance criteria, stakeholder summaries, document titles |

### Dev (`y-dev-*`)

| Rule | Description |
|------|-------------|
| `y-dev-rfc` | Technical RFC workflow |
| `y-dev-code-docs` | Python docstrings and comments — standards plus gated `/y-dev-code-docs` workflow |
| `y-dev-engineering` | Shared design bar, Python layout, and review scores; auto-attaches on `.py`, read by code review and plan rules; standalone `/y-dev-engineering` review |

### Test (`y-tst-*`)

| Rule | Description |
|------|-------------|
| `y-tst-testing-criteria` | Testing-criteria doc for product/tech/QA sign-off |
| `y-tst-test-cases` | Test-cases document structure; each case follows `y-tst-test-case` |
| `y-tst-test-case` | Reusable single test case format (`TST-AREA-NNN`) |
| `y-tst-unit-of-code` | Manual unit tests; Docker Compose; `cursor_workspace/ai_test` reports |

### Insight (`y-ins-*`)

| Rule | Description |
|------|-------------|
| `y-ins-e2e-report` | Final E2E report: Detailed + Compact + QA Test Samples (`-qa.md` for Jira) |

### Other

| Rule | Description |
|------|-------------|
| `y-git-commits` | Analyze uncommitted work; create atomic Conventional Commits with AskQuestion gates |
| `y-git-create-pr` | Full task / hotfix / release PR workflow with checklists and optional Calendar + Slack |
| `y-git-workflow` | Detect legacy vs new path and current step; AskQuestion through QA and production |
| `y-git-branch-name` | Branch naming (`type/JIRA-key/desc`); AskQuestion before checkout |
| `y-git-track-new-files` | Track new task files during implementation |
| `y-team-task-refinement` | Refine vague tasks into well-scoped Jira items before work starts |
| `y-team-task-estimate` | Fibonacci story-point estimate (1–8) for Dev, QA, or both |
| `y-slack-pr-ready-for-review` | PR-ready Slack template; AskQuestion destination; Jira In Review checks |

### Migration (renamed rules and commands)

| Old | New |
|-----|-----|
| `/y-cur-plan` | `/y-agt-plan` |
| `/y-code-review` | `/y-agt-code-review` |
| `y-cur-plan-phase` | `y-agt-plan-phase` |
| `y-cur-plan-guidelines` | `y-agt-plan-guidelines` |
| `y-cur-workspace` | `y-agt-workspace` |
| `y-code-review` | `y-agt-code-review` |
| `y-gc-meet-helper` | `y-agt-gc-meet-helper` |
| `y-communication-b2-english` | `y-agt-communication-b2-english` |
| `y-debug-comments` | `y-agt-debug-comments` |
| `y-diffs` | `y-agt-diffs` |
| `y-task-context` | `y-agt-task-context` |
| `y-python-readability-pep8` (removed) | `y-dev-engineering` — **Python layout** section (`.py` edits only) |
| `y-generative-search-rules/insight/y-ins-e2e-report` | `y-rules/insight/y-ins-e2e-report` (shared; same `/y-ins-e2e-report` command, now in `y-commands/`) |

---

## `y-vencom/y-vencom-commands/`

Slash commands for the **VendorCOM** codebase. Install as `.cursor/commands/y-vencom-commands`.

| Command | Description |
|---------|-------------|
| `/y-tst-e2e-vencom` | VenCom E2E entry — Local simulator or MP Testing |
| `/y-tst-e2e-vencom-owner-report` | Owner Decision Report E2E — layers A/B/C after the VenCom pre-flight |
| `/y-vencom-inbound-payload` | Inbound envelope pointers and local-only `AdditionalData` override |

Final report for these flows: shared `/y-ins-e2e-report`.

---

## `y-vencom/y-vencom-rules/`

Rules for the **VendorCOM** codebase. Install as `.cursor/rules/y-vencom-rules`.

| Rule | Description |
|------|-------------|
| `y-tst-e2e-vencom` | VenCom E2E entry — test-docs, environment, driver; links to repo runbooks |
| `y-tst-e2e-vencom-owner-report` | Owner Decision Report layers (gate, PDF CLI, MP Testing) |
| `y-vencom-inbound-payload` | Envelope pointers; local `jsonb_set` override for `AdditionalData` |

---

## `y-generative-search/y-generative-search-commands/`

Slash commands for the **generative-search** codebase. Install as `.cursor/commands/y-generative-search-commands`.

| Command | Description |
|---------|-------------|
| `/y-tst-e2e` | Unified Roo E2E entrypoint — Resiroo or PMRoo |
| `/y-tst-e2e-resiroo` | ResiRoo E2E — local or MP testing; RabbitMQ or Chat API |
| `/y-tst-e2e-pmroo` | PMRoo E2E — local docker + mp_mock; Chat API; register_pm_requests |
| `/y-create-work-order-in-marketplace` | Create WO in MP testing UI; triage; Start Resiroo Manually |
| `/y-maintenance-work-order` | Maintenance WO text for ResiRoo testing; optional mock photos |
| `/y-resiroo-manual-work-order-payload` | ResiRoo RabbitMQ payload checklist for manual E2E |
| `/y-pmroo-chat-api-payload` | PMRoo Chat API payload checklist for manual E2E |
| `/y-pmroo-verify-register-pm-requests` | Verify PMRoo register_pm_requests in GenSearch DB |
| `/y-mp-client` | Marketplace Client API — search, read, create/update |
| `/y-mp-location` | Marketplace Location API — resolve label to id, CRUD |
| `/y-mp-resident` | Marketplace Resident API — resolve or create resident id |
| `/y-mp-work-order` | Create Marketplace work order via HTTP API only |
| `/y-mp-email-routing` | Route resident emails into MP work orders via SMTP |
| `/y-mp-ai-temp` | Canonical dir for temporary Marketplace test artifacts |
| `/y-upload-photo` | Upload test image to S3; build fetchable HTTPS URL |
| `/y-ins-conversation` | Format ResiRoo / chat DB exports as readable transcripts |
| `/y-ins-trello` | Trello insight — reports, Nightly submit/update, add to Todo |

---

## `y-generative-search/y-generative-search-rules/`

Rules for the **generative-search** codebase. Install as `.cursor/rules/y-generative-search-rules`.

| Rule | Description |
|------|-------------|
| **Test** | |
| `y-tst-e2e` | Unified Roo E2E entrypoint; delegates to Resiroo or PMRoo sub-rules |
| `y-tst-e2e-resiroo` | ResiRoo E2E — local or MP testing; RabbitMQ or Chat API ingress |
| `y-tst-e2e-pmroo` | PMRoo E2E — Chat API, register_pm_requests, optional remote layers |
| **Resiroo** | |
| `y-create-work-order-in-marketplace` | MP UI path — create WO, triage, Start Resiroo Manually, resolve ids |
| `y-maintenance-work-order` | Maintenance WO template in resident voice; optional mock photos |
| `y-resiroo-manual-work-order-payload` | Real WO + RabbitMQ payload checklist for manual E2E |
| **PMRoo** | |
| `y-pmroo-chat-api-payload` | Chat API payload checklist for PMRoo manual E2E |
| `y-pmroo-verify-register-pm-requests` | Verify register_pm_requests — GenSearch DB and optional remote layers |
| **Marketplace** | |
| `y-mp-client` | Client API — search, read, create/update via multipart form |
| `y-mp-location` | Location API — resolve `LOCATION` label to id; CRUD |
| `y-mp-resident` | Resident API — resolve or create resident user id |
| `y-mp-work-order` | Create work order via HTTP API only — no MP web UI |
| `y-mp-email-routing` | Route resident emails into work orders via SMTP |
| `y-mp-ai-temp` | Canonical directory for temporary Marketplace test artifacts |
| `y-upload-photo` | Upload test image to S3; build fetchable HTTPS URL for tests |
| **Insight** | |
| `y-ins-conversation` | Format chat DB exports — transcript plus full field detail |
| `y-ins-trello` | Trello insight — reports, Nightly cards, English polish |
