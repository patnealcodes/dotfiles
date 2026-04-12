require("outline").setup({
  outline_window = {
    auto_close = true,
  },
})

vim.keymap.set("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle outline" })
