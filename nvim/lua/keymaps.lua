local silent = { silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Only needed when clipboard is not set to unnamedplus
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]])

vim.keymap.set("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>=-", [[:lua require("persistence").load() <cr>]], silent)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", silent)

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", silent)

-- Plugins
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFocus<CR>", silent)
vim.keymap.set("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", silent)
