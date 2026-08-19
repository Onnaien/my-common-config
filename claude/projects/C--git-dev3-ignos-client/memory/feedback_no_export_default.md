---
name: feedback_no_export_default
description: Never use export default — always use named exports
metadata: 
  node_type: memory
  type: feedback
  originSessionId: b9e2c21b-fbf4-4a07-b58a-03d2f2960f01
---

Never use `export default`. Always use named exports instead.

**Why:** Project convention. Default exports make refactoring harder (the import name is unconstrained) and are inconsistent with the rest of the codebase.

**How to apply:** When creating or editing any module, export with `export const` / `export function` / `export type`. Update the corresponding import to use `{ namedExport }` syntax. Applies to hooks, components, utilities, and types alike.
