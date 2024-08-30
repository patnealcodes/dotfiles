return {
  "f-person/git-blame.nvim",
  config = function()
    require('gitblame').setup {
      enabled = false,
      message_template = " <author> • <date> • <summary>",
      message_when_not_committed = " Not Committed Yet",
      highlight_group = "GitBlameInline",
      date_format = "%m-%d-%y"
    }

    vim.keymap.set("n", "<leader>gb", "<CMD>GitBlameToggle<CR>", { desc = "Toggle git blame" })
    vim.keymap.set("n", "<leader>gof", "<CMD>GitBlameOpenFileURL<CR>", { desc = "Open file in GitHub" })
    vim.keymap.set("n", "<leader>goc", "<CMD>GitBlameOpenCommitURL<CR>",
      { desc = "Open commit of current line in GitHub" })
    vim.keymap.set("n", "<leader>gcf", "<CMD>GitBlameCopyFileURL<CR>", { desc = "Copy github url of file" })
    vim.keymap.set("n", "<leader>gcc", "<CMD>GitBlameCopyCommitURL<CR>",
      { desc = "Copy github url of current line's commit" })
  end
}
