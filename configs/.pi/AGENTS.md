# PI CONFIG WORKSPACE

This directory is the dotfiles-managed source for the user's global pi config. It is stowed into `~/.pi`.

## Shared instructions

`agent/AGENTS.md` links to the harness-agnostic instructions in `configs/.agents/AGENTS.md`, so pi loads the same global instructions as other harnesses. Keep this file limited to pi config workspace guidance.

## Current structure

```
configs/.pi/
├── AGENTS.md            # pi config workspace guidance
├── package.json         # npm workspace root for extension type-checking
├── tsconfig.json        # strict TypeScript config for local extensions
├── agent/
│   ├── AGENTS.md        # link to shared global agent instructions
│   ├── settings.json    # provider/model/theme defaults
│   ├── cloak.json        # pi-cloak masking rules
│   ├── extensions/
│   │   ├── answer.ts             # /answer command + Ctrl+. shortcut
│   │   ├── git-interceptor.ts    # git editor env + --no-verify guard
│   │   ├── whimsical.ts          # custom working messages
│   │   └── pi-cloak/index.ts     # masks sensitive read-tool output
│   └── themes/
│       └── catppuccin-macchiato.json
└── README.md
```

## Commands

Run from `configs/.pi`:

```bash
npm install
npm run check
```

Use `/reload` in pi after changing extensions, themes, or settings.

## Conventions

- Keep this config additive and machine-safe: do not overwrite `agent/auth.json` or session files.
- Do not commit `node_modules/`, auth data, sessions, or other runtime state.
- Standalone global extensions live in `agent/extensions/*.ts`.
- Directory extensions live in `agent/extensions/<name>/index.ts`.
- If a future extension needs its own package dependencies, add a `package.json` in that extension directory and keep it compatible with the root workspace.
- Keep extension code ESM/TypeScript and compatible with pi auto-discovery.

## Current settings

`agent/settings.json` intentionally keeps this machine's provider/model defaults while selecting the imported theme and loading the configured pi package:

```jsonc
{
  "defaultProvider": "openai-codex",
  "defaultModel": "gpt-5.5",
  "defaultThinkingLevel": "high",
  "theme": "catppuccin-macchiato",
  "packages": ["npm:@plannotator/pi-extension"]
}
```

Pi package entries in `agent/settings.json` are installed and managed by pi. Do not duplicate them in this workspace `package.json` unless local TypeScript checks import them directly.
