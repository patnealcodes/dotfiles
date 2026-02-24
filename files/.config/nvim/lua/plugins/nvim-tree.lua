return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    actions = {
      change_dir = {
        enable = false
      }
    },
    filters = {
      custom = { ".git", "node_modules", ".vscode" },
      dotfiles = false,
    },
    git = {},
    view = {
      adaptive_size = true,
    }
  }
}
