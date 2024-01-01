vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("c", "<C-j>", "<C-n>", {})
keymap.set("c", "<C-k>", "<C-p>", {})

keymap.set("n", "<C-u>", "<C-u>zz", {})
keymap.set("n", "<C-d>", "<C-d>zz", {})

-- keymap.set("n", "x", "_x", {})
keymap.set("x", "p", [["_dP]])

keymap.set("n", "<C-[>", "<cmd>BufferLineCyclePrev<CR>", {})
keymap.set("n", "<C-]>", "<cmd>BufferLineCycleNext<CR>", {})

keymap.set("n", "<Esc>", ":nohl<CR>", {})
