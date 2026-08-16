---
description: Testing Criteria for Tech/QA — always saves full md doc; AskQuestion for doc vs Slack vs Jira field excerpt
---

# Test: testing criteria (`/y-tst-testing-criteria`)

Read and follow **`.cursor/rules/y-rules/test/y-tst-testing-criteria.mdc`** end-to-end.

## Mandatory first step

1. **`AskQuestion`** — output type: **doc** / **Slack** (full Jira Testing Criteria field excerpt) / **Jira** (concise Jira Testing Criteria field excerpt) / **other**.
2. Resolve **`<JIRA-KEY>`**, write the full doc to `docs/<JIRA-KEY>/testing-criteria-<jira-key>-<YYYYMMDD-HHMM>.md`, then deliver the type-specific chat output.

**All types** save the same full markdown file as **doc**. **Slack** and **Jira** also show a paste-ready excerpt for the ticket’s **Testing Criteria** field (not Jira comments).

Derive executable scenarios in **`.cursor/rules/y-rules/test/y-tst-test-cases.mdc`**.
