# Synced Claude Code config

This folder is meant to be pointed to by the `CLAUDE_CONFIG_DIR` environment
variable so Claude Code uses it as its config home (instead of the default
`~/.claude`) on any machine.

## What's synced here

- `CLAUDE.md` — global user instructions
- `settings.json` — user-level settings (permissions, model, statusline, hooks)
- `projects/<project-slug>/memory/` — auto-memory files per project

Project memory folders are keyed by the project's absolute working-directory
path (e.g. `C--git-dev3-ignos-client` maps to `C:\git\dev3\ignos-client`).
This only resolves correctly on another machine if the repo is checked out
at the *same* absolute path there too.

## Deliberately NOT synced

These stay local to each machine/user and must never be committed here:

- `.credentials.json` — OAuth session tokens
- `history.jsonl`, `sessions/`, `session-env/`, `shell-snapshots/`, `ide/`,
  `file-history/`, `backups/`, `cache/`, `downloads/`, `plans/` — session
  state and transient/machine-specific data
- `mcp-needs-auth-cache.json`, `policy-limits.json`, `remote-settings.json`
- Full project transcripts (the `.jsonl` files and per-session subfolders
  under `projects/<slug>/`) — only the `memory/` subfolder is synced
- `keybindings.json` — not present yet (defaults in use); if customized
  later, review before syncing (it's fine to sync, just wasn't set up here)

## Setup on a new machine

1. Clone this repo.
2. Set `CLAUDE_CONFIG_DIR` to the absolute path of this `claude/` folder
   (e.g. in `$PROFILE` for PowerShell, or `.bashrc`/`.zshrc` on macOS/Linux).
3. Restart the shell / Claude Code.
