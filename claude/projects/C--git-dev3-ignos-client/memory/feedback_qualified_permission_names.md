---
name: feedback-qualified-permission-names
description: Permission/role helper objects should return module-qualified field names (isKeepAdmin), not generic ones (isAdmin)
metadata:
  type: feedback
---

When writing a `get<Module>Permissions(userRoles)` helper (e.g. `getKeepPermissions` in `src/apps/keep/keepAuthorization.ts`), return module-qualified field names like `isKeepAdmin`/`isKeepOperator` — not generic `isAdmin`/`isOperator`.

**Why:** `core/roles.ts` already defines a generic `'Admin'` role alongside module-specific ones (`Keep.Admin`, `Keep.Operator`, etc.). A permissions object with a bare `isAdmin` field reads as ambiguous next to that generic role, and forces every call site to rename on destructure (`const { isAdmin: isKeepAdmin } = getKeepPermissions(...)`) just to get a clear local name. The user rejected this even after I explained the destructure-rename syntax was technically correct — the objection was naming clarity, not correctness.

Note this diverges from the pre-existing `getInspectPermissions` pattern in `src/apps/inspect/inspectAuthorization.ts`, which does use bare `isAdmin`/`isOperator`. Don't assume that's still the preferred convention — this was pushback specifically on `keepAuthorization.ts`, so ask before propagating it back to inspect-style helpers, but default to qualified names in new module permission helpers.

**How to apply:** When adding a new `is<Module><Role>` helper or a `get<Module>Permissions` aggregator, name every returned field with the module prefix so it's unambiguous at every call site without renaming.
