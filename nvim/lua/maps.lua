vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set({ "c", "n", "i" }, "<Down>", "<C-n>")
keymap.set({ "c", "n", "i" }, "<Up>", "<C-p>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap.set("x", "p", [["_dP]])
keymap.set({ "n", "v" }, "y", [["+y]])
keymap.set("n", "Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-I>", "<cmd>BufferLineCyclePrev<CR>")
keymap.set("n", "<C-O>", "<cmd>BufferLineCycleNext<CR>")
keymap.set("n", "<C-w>", "<cmd>bd<CR>")

keymap.set("n", "<leader>nh", ":nohl<CR>")

