# PI CONFIG WORKSPACE

This directory is the dotfiles-managed source for the user's global pi config. It is stowed into `~/.pi`.

## Communication style

- Use plain, direct language, like one human talking to another.
- Avoid jargon when ordinary words will do. Briefly explain technical terms when they are necessary.
- Be concise by default and lead with the answer or outcome.
- Go into depth when the user asks, or when important context is needed to prevent confusion, mistakes, or risk.

## Implementation style

- Focus code changes on the user's stated goal and the requirements needed to achieve it.
- Prefer the simplest complete solution that remains correct, readable, maintainable, and consistent with the existing codebase.
- Do not add abstractions, extensibility, configuration, dependencies, or speculative handling for requirements the user did not ask for.
- Raise legitimate concerns and address material correctness, security, or reliability risks, but do not let optional improvements expand the scope unnecessarily.
- When a broader solution may be useful but is not required, mention it briefly instead of implementing it by default.

## Current structure

```
configs/.pi/
├── package.json          # npm workspace root for extension type-checking
├── tsconfig.json         # strict TypeScript config for local extensions
├── agent/
│   ├── settings.json     # provider/model/theme defaults
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
