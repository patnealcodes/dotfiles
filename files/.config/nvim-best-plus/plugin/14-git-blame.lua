require("gitblame").setup({
  enabled = true,
  message_template = "git <author> - <date> - <summary>",
  message_when_not_committed = "git Not Committed Yet",
  highlight_group = "GitBlameInline",
  date_format = "%m-%d-%y",
})

vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle git blame" })
vim.keymap.set("n", "<leader>gof", "<cmd>GitBlameOpenFileURL<cr>", { desc = "Open file in GitHub" })
vim.keymap.set("n", "<leader>goc", "<cmd>GitBlameOpenCommitURL<cr>", { desc = "Open line commit in GitHub" })
vim.keymap.set("n", "<leader>gcf", "<cmd>GitBlameCopyFileURL<cr>", { desc = "Copy GitHub file URL" })
vim.keymap.set("n", "<leader>gcc", "<cmd>GitBlameCopyCommitURL<cr>", { desc = "Copy GitHub commit URL" })
