return {
  {
    "nvim-lua/plenary.nvim",
    name = "plenary"
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "plenary" },
  },
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.keymap.set('n', 'U', vim.cmd.UndotreeToggle)
    end
  },
  "tpope/vim-fugitive",
  "norcalli/nvim-colorizer.lua",
}
