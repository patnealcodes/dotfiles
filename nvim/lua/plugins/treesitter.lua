return {
  {
  "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "bash", "lua", "vim", "javascript", "typescript", "regex", "tsx", "html", "css", "scss", "python", "rust", "go" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scoe_incremental = false,
            node_decremental = "<bs>"
          }
        }
      })

    end
  },
  {"nvim-treesitter/nvim-treesitter-context"}
}
