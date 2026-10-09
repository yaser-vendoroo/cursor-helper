---
description: Full + compact + QA Test Samples markdown E2E reports (shared; any project pack)
---

# Insight: E2E report (`/y-ins-e2e-report`)

Read and follow **`.cursor/rules/y-rules/insight/y-ins-e2e-report.mdc`** end-to-end.

Always produce **full** (`Detailed`) then **compact** (`-compact.md`). Then a **QA Test Samples** file (`-qa.md`) for Jira **Test Samples** when `docs/<JIRA>/test-cases.md` exists (skip QA file only; never skip Detailed or Compact). **Detailed** includes a **Related documents** section with links to `test-cases.md`, `testing-criteria.md`, and other insightful repo docs; **Compact** and **QA** omit those links. **QA** mirrors the **entire** test-cases doc (every case, doc order, team-facing, no noise) — not a `TST-*` subset. Compact stays the Slack/shareable default. The QA file has **no Metadata** section: **Cases covered** list plus short per-case Goal / Setup / Pass-Fail / expected vs observed.

Each report **filename** and **H1 title** must follow **`y-ins-e2e-report`** — pattern `E2E Report - <JIRA> - <YYYYMMDD-HHMM> - <scenario>` (QA H1 adds ` - QA`).

Pair with the installed project pack’s E2E entry rule (`y-tst-e2e*`) when producing final E2E artifacts.
