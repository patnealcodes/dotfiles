vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("c", "<Down>", "<C-n>", {})
keymap.set("c", "<Up>", "<C-p>", {})

keymap.set("x", "<C-R>", "y<Esc>:%s/<C-R>'//g<Left><Left>", {})

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-[>", "<cmd>BufferLineCyclePrev<CR>", {})
keymap.set("n", "<C-]>", "<cmd>BufferLineCycleNext<CR>", {})

keymap.set("n", "<Esc>", ":nohl<CR>", {})
