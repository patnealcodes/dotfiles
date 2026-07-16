# Pi config

Global pi configuration managed by this dotfiles repo and stowed into `~/.pi`.

## What is tracked here

This package currently tracks a small, selected subset of the reference `.temp-slop/.pi` config:

- `agent/settings.json` — pi defaults; keeps `openai-codex` / `gpt-5.5`, uses high thinking, loads `npm:@plannotator/pi-extension`, and selects the `catppuccin-macchiato` theme.
- `agent/cloak.json` — patterns consumed by the local `pi-cloak` extension to mask secrets in read-tool output.
- `agent/extensions/answer.ts` — `/answer` command and `Ctrl+.` shortcut for answering extracted assistant questions.
- `agent/extensions/git-interceptor.ts` — prevents git editor hangs and blocks `--no-verify`.
- `agent/extensions/pi-cloak/index.ts` — read-output secret masking extension.
- `agent/extensions/whimsical.ts` — playful working-status messages.
- `agent/themes/catppuccin-macchiato.json` — custom TUI theme.

Runtime state such as `agent/auth.json`, `agent/sessions/`, `agent/npm/`, and `node_modules/` is intentionally not tracked.

## Dependency workspace

This directory is an npm workspace root so the TypeScript extensions can be checked from the dotfiles checkout.

Install or refresh dependencies:

```bash
cd configs/.pi
npm install
```

Run checks:

```bash
npm run check
```

After changing extension code, reload pi with `/reload`.

## Notes

- Pi package dependencies listed in `agent/settings.json` are installed/managed by pi itself, not by this workspace `package.json`.
- The OpenCode Cloudflare provider, MCP config, web tools, save-md, and skill-toggle extensions from the reference config were not imported.
- There are no `agent/skills/` checked into this config. Global skills still load from pi's normal global skill locations, such as `~/.agents/skills/`.
- Keep provider/model changes in `agent/settings.json` deliberate; the current provider and model defaults are preserved from this machine's existing config.
