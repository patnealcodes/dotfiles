return {
  "f-person/git-blame.nvim",
  config = function()
    require("gitblame").setup({
      enabled = true
    })
    vim.keymap.set("n", "<leader>gbb", "<cmd>GitBlameToggle<CR>", { desc = "Toggle Git Blame", silent = true })
    vim.keymap.set("n", "<leader>gbo", "<CMD>GitBlameOpenCommitURL<CR>", { desc = "Open Git Blame Commit URL" })
    vim.keymap.set("n", "<leader>gbf", "<CMD>GitBlameOpenFileURL<CR>", { desc = "Open Git Blame File URL" })
  end
}
