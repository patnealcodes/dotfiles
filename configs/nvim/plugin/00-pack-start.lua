local plugins = {
  "https://github.com/catppuccin/nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/tpope/vim-fugitive",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/f-person/git-blame.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/hedyhli/outline.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/isak102/telescope-git-file-history.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/akinsho/git-conflict.nvim",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("1.x"),
  },
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/mbbill/undotree",
}

if vim.fn.executable("make") == 1 then
  table.insert(plugins, "https://github.com/nvim-telescope/telescope-fzf-native.nvim")
end

vim.pack.add(plugins)

vim.pack.add({
  { src = "https://github.com/folke/persistence.nvim", name = "persistence" },
  { src = "https://github.com/ThePrimeagen/harpoon", name = "harpoon", version = "harpoon2" },
  {
    src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    name = "nvim-treesitter-textobjects",
    version = "main",
  },
}, {
  load = function()
  end,
})
