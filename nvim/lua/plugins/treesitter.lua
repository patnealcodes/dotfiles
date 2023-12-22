return {
  {
  "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
    config = function()

      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "lua", "vim", "javascript", "typescript", "regex", "tsx", "html", "css", "scss", "python" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })

    end
  },
  {"nvim-treesitter/nvim-treesitter-context"}
}
