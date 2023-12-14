vim.g.mapleader = " "

vim.keymap.set("n", "<C-c>", vim.cmd.Escape)
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })

-- Compound movements
vim.keymap.set("n", "<leader>=", "m8gg=G`8", { desc = "Select all, format, then go back to where you were" })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Command (:) Shortcuts
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ln", vim.cmd.Lazy)
