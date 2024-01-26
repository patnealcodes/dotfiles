return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "css",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "lua",
        "rust",
        "scss",
        "toml",
        "typescript",
        "tsx",
        "vim",
        "vimdoc",
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
