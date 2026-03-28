# Neovim Configuration (Best Blend)

This is a Neovim configuration built around **vim.pack** (Neovim 0.12+), combining:

- GPT's stronger plugin bootstrap and hook structure
- Opus's closer fidelity to the original editor workflow
- Kimi's practical documentation style

## Requirements

- Neovim v0.12.0-dev or later
- Git
- `make` (optional, only for `telescope-fzf-native.nvim`)

## Quick Start

1. Backup your current config if needed:

   ```bash
   mv ~/.config/nvim ~/.config/nvim-backup
   ```

2. Copy this config into place:

   ```bash
    cp -r ./nvim-best-plus ~/.config/nvim
   ```

3. Start Neovim:

   ```bash
   nvim
   ```

On first launch, `vim.pack` prompts to install plugins. Confirm the install and let Neovim finish setup.

## What This Config Optimizes For

- predictable startup with a centralized plugin bootstrap
- practical lazy-loading for optional plugins
- Lua-specific loading for `lazydev.nvim` instead of eager-loading it for every session
- a familiar editing workflow with Telescope, Oil, NvimTree, LSP, Treesitter, Harpoon, and session restore
- maintainable structure without excessive indirection

## Project Structure

```text
nvim-best-plus/
|- init.lua                  # Entry point
|- README.md                 # Setup and maintenance notes
|- .luarc.json               # Lua language server settings
|- .stylua.toml              # Formatting settings
|- lua/
|  |- auto.lua               # Core autocommands
|  |- keymaps.lua            # Global keymaps
|  |- opts_config.lua        # Vim options
|  `- pack_helpers.lua       # vim.pack helper utilities
`- plugin/
   |- 00-pack-hooks.lua      # PackChanged hooks for updates/build steps
   |- 00-pack-start.lua      # Central plugin registration
   |- 01-colors.lua          # Colorscheme setup
   |- 10-mini.lua            # mini.nvim modules and statusline
   |- 14-git-blame.lua       # Git blame setup
   |- 18-oil.lua             # Oil file explorer
   |- 20-nvim-tree.lua       # NvimTree setup
   |- 25-outline.lua         # Symbol outline
   |- 30-treesitter.lua      # Treesitter setup
   |- 40-telescope.lua       # Telescope setup
   |- 50-blink.lua           # Completion setup
   |- 60-lsp.lua             # LSP and Mason setup
   |- 70-undotree.lua        # Undo history UI
   |- 80-persistence.lua     # Session restore setup
   |- 90-harpoon.lua         # Harpoon setup
   `- 95-treesitter-textobjects.lua
```

## Key Behaviors

- `PackChanged` hooks handle post-install work for Treesitter and `telescope-fzf-native.nvim`
- core plugins are added centrally in `plugin/00-pack-start.lua`
- optional plugins use `packadd` only when needed
- `lazydev.nvim` is loaded only when editing Lua files
- both `Oil` and `NvimTree` are available:
  - `-` opens Oil in a float with a side preview
  - `<C-b>` toggles NvimTree on the current file

## Common Keymaps

- `<leader>sf` search files
- `<leader>sg` live grep
- `<leader><leader>` search open buffers
- `<leader>o` toggle outline
- `<leader>u` toggle Undotree
- `<leader>=-` restore the last session
- `<leader>ha` add file to Harpoon
- `<leader>ht` open Harpoon picker
- `gd`, `gr`, `K`, `<leader>ca`, `<leader>cr` LSP actions when a server is attached

## Managing Plugins

### Update plugins

Inside Neovim:

```vim
:lua vim.pack.update()
```

### Add a plugin

1. Add it to `plugin/00-pack-start.lua` if it should load eagerly
2. Add it to the optional `vim.pack.add()` block there if it should be loaded with `packadd`
3. Create a matching file in `plugin/` for its setup

Use an autocmd or on-demand `packadd` when a plugin only makes sense for a narrow workflow or filetype.

### Remove a plugin

1. Remove it from `plugin/00-pack-start.lua`
2. Remove its setup file from `plugin/` if present
3. Remove it from disk with `:lua vim.pack.del({ "plugin-name" })` if desired

## Troubleshooting

Run:

```vim
:checkhealth vim.pack
```

Common things to verify:

- plugin setup should happen only after the plugin has been added
- `make` is optional; without it, `telescope-fzf-native.nvim` is skipped and a warning is shown during install/update
- if plugin state gets weird, remove any generated `nvim-pack-lock.json` and restart

## Testing Side-by-Side

You can test this config without replacing your main setup:

```bash
mkdir -p ~/.config
ln -sf $(pwd)/nvim-best-plus ~/.config/nvim-best-plus
NVIM_APPNAME=nvim-best-plus nvim
```

## Notes

- This config intentionally does **not** commit a lockfile here. Let `vim.pack` generate `nvim-pack-lock.json` for your local environment after first install.
- If you want fully reproducible plugin revisions, generate the lockfile once after installation and keep it with this config.
