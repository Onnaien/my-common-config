---
name: feedback-link-prs-jira
description: Always cross-link GitHub PRs and Jira issues in this project (ignos-client)
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 82869df4-9728-4f28-8b75-00cdc6df5a9e
  modified: 2026-08-19T10:25:29.218Z
---

Always link a PR back to its Jira issue, and vice versa, whenever creating a PR for work tied to a Jira ticket (e.g. `SD-144`).

**Why:** User explicitly asked ("yes always link the prs and jr issues") after a PR was created for SD-144 without a link back to the issue.

**How to apply:** When creating a PR for a Jira-tracked change (branch/commit named like `SD-144-...`), after the PR is created:
1. Add a comment on the Jira issue with the PR URL (via `addCommentToJiraIssue`).
2. Include the Jira issue URL in the PR body (already doing this by convention — keep it up).
3. Transition the Jira issue to the appropriate "Pull Request" status (e.g. "FE - Pull Request" for frontend work, "BE - Pull Request" for backend) via `getTransitionsForJiraIssue` + `transitionJiraIssue` — look up the transition id per-issue since ids can vary by workflow.

Do all of this proactively without being asked again.
