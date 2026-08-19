---
name: feedback-stack-gap-spacing
description: "Prefer CSS gap (Stack useFlexGap or sx gap) over Stack's default margin-based spacing, adopted opportunistically in touched files"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: a0fabf04-bc4b-4ac9-b5f4-b1f9b0cbc9e1
---

When touching a component that uses MUI `<Stack spacing={n}>`, prefer switching it to `<Stack useFlexGap spacing={n}>` (or `sx={{ gap: n }}` on a flex container if it's not already a Stack) instead of leaving the default margin-based spacing.

**Why:** MUI's `Stack` defaults to `useFlexGap: false` (margin-based spacing via descendant selectors), which has a real documented limitation — margin is only applied in the primary axis direction, so wrapped rows (`flexWrap`) don't get consistent cross-axis spacing. The user hit this directly and fixed it with `useFlexGap` in [BookingsList.tsx](../../../../../../git/dev1/ignos-client/src/apps/move/driver/BookingsList.tsx). Real CSS `gap` avoids this and has been universally supported for years, so there's no browser-support tradeoff left.

**How to apply:** Do NOT do a dedicated codebase-wide sweep to migrate all ~289 existing `Stack spacing` usages (rejected as unnecessary churn/risk for no active bug). Instead, apply the boy-scout rule: when a diff already touches a file with `Stack spacing`, add `useFlexGap` (or convert to `sx gap` if not a Stack) as part of that change. Don't go out of your way to touch files solely for this.
