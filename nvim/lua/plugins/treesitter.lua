return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "css",
        "javascript",
        "lua",
        "python",
        "rust",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
        "yaml"
      },
      auto_install = true,
      highlight = {
        enable = true
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Tab>",
          node_incremental = "<Tab>",
          node_decremental = "<S-Tab>",
        }
      }
    })
  end
}
