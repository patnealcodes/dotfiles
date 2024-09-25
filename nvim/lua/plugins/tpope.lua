return {
  "tpope/vim-sleuth",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    "tpope/vim-fugitive",
    config = function()
      vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>", { desc = "Git Blame with Fugutive" })
      vim.keymap.set("n", "<leader>go", "<cmd>.GBrowse<cr>", { desc = "Open the current line in github" })
      vim.keymap.set("n", "<leader>gc", "<cmd>.GBrowse!<cr>", { desc = "Copy a link to the current line in github" })
    end
  }
}
