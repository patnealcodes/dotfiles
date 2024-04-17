vim.g.mapleader = " "
local keymap = vim.keymap

--// UNMAP \\--
keymap.set({ "c", "n", "i" }, "<S-Up>", "")
keymap.set({ "c", "n", "i" }, "<S-Down>", "")

--// BASE \\--
keymap.set({ "c", "n", "i" }, "<C-c>", "<Esc>")
keymap.set({ "c", "n", "i" }, "<Down>", "<C-n>")
keymap.set({ "c", "n", "i" }, "<Up>", "<C-p>")

keymap.set("n", "<Esc>", "<CMD>nohl<CR>")

keymap.set("n", "<leader>rp", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("x", "p", [["_dP]])
keymap.set({ "n", "v" }, "y", [["+y]])
keymap.set("n", "Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Oil
keymap.set("n", "<leader>-", "<CMD>Oil --float<CR>")
