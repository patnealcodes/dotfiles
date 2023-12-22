vim.g.mapleader = " "

-- general
vim.keymap.set({'i', 'v'}, '<C-c>', '<Esc>')
vim.keymap.set('c', '<C-j>', '<Down>')
vim.keymap.set('c', '<C-k>', '<Up>')
vim.keymap.set('n', '<Down>', '<C-d>')
vim.keymap.set('n', '<Up>', '<C-u>')
vim.keymap.set("n", "<leader>nh", "<Cmd>nohl<CR>")
vim.keymap.set("n", "<leader>=", "m8gg=G`8")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>nh", "<Cmd>nohl<CR>")
vim.keymap.set("v", "<C-r>", "y:%s/<C-r>0/")

-- plugins
-- neotree
vim.keymap.set('n', '<C-b>', '<Cmd>Neotree toggle<CR>')
