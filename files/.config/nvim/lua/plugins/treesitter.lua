return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({

      ensure_installed = {
        "bash", "c", "diff", "html", "css", "javascript", "typescript", "tsx",
        "json", "jsonc", "lua", "luadoc", "markdown", "markdown_inline",
        "python", "query", "regex", "vim", "vimdoc", "yaml", "toml", "rust", "go",
      },
      sync_install = false,
      auto_install = true,
      indent = {
        enable = true
      },
    })
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
