# Neovim Configuration

## Requirements

- Neovim v0.12.0-dev or later
- Git
- `make` (optional, only for `telescope-fzf-native.nvim`)

On first launch, `vim.pack` prompts to install plugins. Confirm the install and let Neovim finish setup.

## What This Config Optimizes For

- predictable startup with a centralized plugin bootstrap
- practical lazy-loading for optional plugins
- Lua-specific loading for `lazydev.nvim` instead of eager-loading it for every session
- maintainable structure without excessive indirection

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
