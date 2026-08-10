---
description: Full + compact shareable markdown E2E reports for Marketplace and local ResiRoo/PMRoo runs
---

# Insight: E2E report (`/y-ins-e2e-report`)

Read and follow **`.cursor/rules/y-generative-search-rules/insight/y-ins-e2e-report.mdc`** end-to-end.

Produces **two** artifacts per run: a **full** internal report and a **compact** report (`-compact.md`) sanitized for other teams.

Each report **filename** and **H1 title** must follow **`y-ins-e2e-report`** — pattern `E2E Report - <JIRA> - <YYYYMMDD-HHMM> - <scenario>` (e.g. `# E2E Report - VAP-2325 - 20260730-1612 - leak check E2E`).

Pair with **`.cursor/rules/y-generative-search-rules/test/y-tst-e2e.mdc`** and the ResiRoo or PMRoo runbooks when producing final E2E artifacts.
