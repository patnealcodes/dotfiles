if vim.fn.exists(":LazyGit") == 2 then
  vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
end
