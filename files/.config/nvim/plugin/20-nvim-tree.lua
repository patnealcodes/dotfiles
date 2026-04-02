require("nvim-tree").setup({
  actions = {
    change_dir = {
      enable = false,
    },
  },
  filters = {
    custom = { ".git", "node_modules", ".vscode" },
    dotfiles = false,
  },
  git = {},
  view = {
    adaptive_size = true,
  },
})
