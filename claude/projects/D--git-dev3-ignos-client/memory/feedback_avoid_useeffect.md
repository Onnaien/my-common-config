---
name: feedback-avoid-useeffect
description: User prefers avoiding useEffect where possible — derive state instead
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 5aa6e3d7-8c9e-411b-ab06-4ff5523b1f5a
---

Avoid `useEffect` where possible. Prefer:
- Deriving values directly during render
- The React "update state on render" pattern (`if (x !== prevX) { setPrevX(x); ... }`)
- Module-level initialization for one-time setup

**Why:** User finds effects harder to reason about and prefers explicit data flow.

**How to apply:** Before reaching for `useEffect`, ask if the value can be computed from existing state/props during render. Only use `useEffect` when there is a genuine external side effect (DOM manipulation, subscriptions, resetting dialog-local state on open).
