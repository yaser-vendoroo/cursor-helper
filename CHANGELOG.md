# Changelog

All notable changes to **cursor-helper** are documented here.

Format based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.3.0] - 2026-08-16

### Added

- `/y-team-task-estimate` — fast Fibonacci (1–8) story-point estimate for an existing Jira ticket

### Changed

- Testing criteria, test cases, unit-of-code, Slack PR-ready, and Python readability now live in shared `y-rules` / `y-commands` (install those for generative-search too)
- Slack PR-ready asks for destination from a known team-channel list instead of always posting to `#generative-search-team`
- `/y-dev-code-docs` asks docstring style once (Google recommended; PEP 257 or NumPy optional); casual Python edits stay Google

## [1.2.0] - 2026-08-10

### Added

- Code documentation workflow for Python (`/y-dev-code-docs`) — fill gaps, revise, or clean docstrings and comments on a chosen scope
- Planning workflow can add code-docs todos when a plan introduces new Python APIs
- Code review can save a markdown report with a consistent dated title and filename

### Changed

- E2E report titles and filenames now include the Jira key and a shorter run timestamp (`YYYYMMDD-HHMM`)
- New Trello insight cards are added at the top of the list
- README documents symlink install, path conventions, and the full command/rule catalog

### Fixed

- Rule and command cross-references match the installed symlink layout (`.cursor/rules/y-rules`, generative-search rules)

## [1.1.0] - 2026-07-30

### Added

- E2E and unit-test reports include the run date and time in the report title and filename

### Fixed

- Create PR workflow shows the title and body draft before checklist questions
- Trello date-archive list is created after the Done column (not at the board edge)

## [1.0.0] - 2026-07-30

### Added

- `/y-agt-plan` — pre-plan workflow, then Cursor or Rules plan approach, optional diagrams
- `/y-agt-code-review` — replaces the former code-review slash command
- Plan phase rule — ticket, approach, E2E scope, guardrails, plan style
- Workspace defaults — output paths under `cursor_workspace/`; plans use Cursor Plan mode
- Technical RFC workflow (`y-dev-rfc`)
- README with install overview and rename migration table

### Changed

- Agent rules and slash commands renamed to the `y-agt-*` namespace — update `@` references and slash commands (see README migration table)

### Removed

- `/y-git-code-review` and `y-cur-*` rule/command entry points (use `y-agt-*` equivalents)

## [0.1.0] - 2026-06-19

### Added

**Shared — Git**

- Group uncommitted changes into atomic Conventional Commits (`/y-git-commits`)
- Draft commit messages; optional amend unpushed HEAD (`/y-git-commit-message`)
- Branch naming with Jira key before checkout (`/y-git-branch-name`)
- Create PR for task, hotfix, or release paths (`/y-git-create-pr`)
- Code review of unpushed commits (`/y-git-code-review`)
- Stage new task files so nothing important stays untracked (`/y-git-track-new-files`)

**Shared — Agent**

- B2 English replies — clear, complete, professional
- Preserve user debug comments and instrumentation unless asked to remove
- Task-related unified diffs for handoff docs (Confluence, Jira)
- Google Calendar PR review — handoff notes or draft calendar event
- Task context — acceptance criteria, stakeholder summaries, document titles
- Plan guidelines for Cursor plan documents
- Code review workflow with AskQuestion gates

**Shared — Team and dev**

- Refine vague tasks into well-scoped Jira items before work starts
- Reusable single test case format (`TST-AREA-NNN`)

**Generative-search — Testing**

- Unified Roo E2E entrypoint — Resiroo or PMRoo (`/y-tst-e2e`)
- ResiRoo E2E — local or MP testing; RabbitMQ or Chat API (`/y-tst-e2e-resiroo`)
- PMRoo E2E — Chat API, register_pm_requests (`/y-tst-e2e-pmroo`)
- Test-cases document structure for a work item (`/y-tst-test-cases`)
- Testing criteria doc for tech/QA sign-off (`/y-tst-testing-criteria`)
- Manual unit/class verification via Docker Compose (`/y-tst-unit-of-code`)

**Generative-search — Resiroo**

- Create work order in Marketplace testing UI; triage; Start Resiroo Manually
- Maintenance work order text in resident voice; optional mock photos
- ResiRoo RabbitMQ payload checklist for manual E2E

**Generative-search — PMRoo**

- PMRoo Chat API payload checklist for manual E2E
- Verify `register_pm_requests` in GenSearch DB

**Generative-search — Marketplace**

- Client API — search, read, create/update
- Location API — resolve label to id; CRUD
- Resident API — resolve or create resident id
- Create work order via HTTP API only
- Route resident emails into work orders via SMTP
- Canonical directory for temporary Marketplace test artifacts
- Upload test image to S3; build fetchable HTTPS URL

**Generative-search — Insight and Slack**

- Final markdown report structure for E2E runs
- Format ResiRoo / chat DB exports as readable transcripts
- Trello insight — reports, Nightly submit/update, add to Todo
- Slack PR-ready template for #generative-search-team; Jira In Review checks

**Generative-search — Python**

- Python readability, PEP 8, and vertical spacing standards
