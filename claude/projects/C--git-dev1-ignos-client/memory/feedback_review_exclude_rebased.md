---
name: feedback_review_exclude_rebased
description: "When reviewing branch changes, exclude code that came from rebasing master onto the branch"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 362abe57-247b-4d96-98c0-c1d9fc3ab360
---

When doing a branch code review (e.g. `git diff master...HEAD`), exclude changes that were pulled in from master via rebase — e.g. CI workflow version bumps, package-lock.json updates, dependency upgrades that the user didn't author.

**Why:** These are upstream changes rebased in, not the user's own work. Including them in a review adds noise and dilutes focus on the actual feature/fix changes.

**How to apply:** When reviewing, identify and skip files/hunks that are clearly rebase carry-overs (CI config action version bumps, lock file changes, dependency bumps not tied to a feature). Focus the review on the app source code changes the user authored.
