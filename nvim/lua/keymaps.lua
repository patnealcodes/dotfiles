local silent = { silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", silent)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", silent)

vim.keymap.set("n", "J", "mzJ`z", silent)
vim.keymap.set("n", "<C-d>", "<C-d>zz", silent)
vim.keymap.set("n", "<C-u>", "<C-u>zz", silent)
vim.keymap.set("n", "n", "nzzzv", silent)
vim.keymap.set("n", "N", "Nzzzv", silent)

vim.keymap.set("x", "<leader>p", [["_dP]], silent)

-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Only needed when clipboard is not set to unnamedplus
vim.keymap.set("n", "<leader>Y", [["+Y]], silent)

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], silent)
vim.keymap.set({ "n", "v" }, "<leader>D", [["_D]], silent)

vim.keymap.set("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("v", "<leader>rp", [[y:%s/\<<C-r><C-O>"\>/<C-r><C-O>"/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>=-", [[:lua require("persistence").load() <cr>]], silent)

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", silent)

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", silent)

-- Plugins
vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Floaty Oil" })

