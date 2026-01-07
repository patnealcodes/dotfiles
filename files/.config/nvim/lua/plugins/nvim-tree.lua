return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  keys = {
    { "<C-p>", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Find file in filetree" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        custom = { ".git", "node_modules", ".vscode" },
        dotfiles = true,
      },
      git = {},
      view = {
        adaptive_size = true,
        float = {
          enable = true,
        },
      },
    })
  end,
}
