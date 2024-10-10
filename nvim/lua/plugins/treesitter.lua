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
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Enter>",
          node_incremental = "<Enter>",
        }
      }
    })
  end
}
