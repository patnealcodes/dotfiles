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

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

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

keymap.set("n", "<C-w>", "<cmd>bd<CR>")
keymap.set("n", "<C-w>!", "<cmd>bd!<CR>")

--// CMD LAZY LOADED PLUGINS \\--

-- Telescope

-- Telescope File Browser
keymap.set("n", "<leader>-", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Browse files" })

-- Undotree
keymap.set("n", "U", vim.cmd.UndotreeToggle)

-- Obsidian
keymap.set("n", "<C-o>", vim.cmd.ObsidianQuickSwitch)

-- Trouble
keymap.set("n", "<leader>tt", vim.cmd.TroubleToggle)

-- Git Messenger
keymap.set("n", "gm", vim.cmd.GitMessenger)
