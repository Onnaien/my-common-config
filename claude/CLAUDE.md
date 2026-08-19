# Global Claude Instructions

## Exports

Never use `export default`. Always use named exports (`export const`, `export function`, `export type`). Update imports accordingly to use `{ namedExport }` syntax. Applies to all modules: hooks, components, utilities, and types.

## React: Avoid useEffect

Avoid `useEffect` where possible. Prefer:

- Deriving values directly during render
- The React "update state on render" pattern (`if (x !== prevX) { setPrevX(x); ... }`)
- Module-level initialization for one-time setup

Only use `useEffect` for genuine external side effects (DOM manipulation, subscriptions, resetting dialog-local state on open).
