vim.g.mapleader = " "
local keymap = vim.keymap

--// UNMAP \\--
keymap.set({ "c", "n", "i" }, "<S-Up>", "")
keymap.set({ "c", "n", "i" }, "<S-Down>", "")

--// BASE \\--
keymap.set({ "c", "n", "i" }, "<C-c>", "<Esc>")
keymap.set({ "c", "n", "i" }, "<Down>", "<C-n>")
keymap.set({ "c", "n", "i" }, "<Up>", "<C-p>")

keymap.set("n", "<leader>nh", "<CMD>nohl<CR>")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("x", "<leader>s", [[:%s/\<>/<>/gI<Left><Left><Left>]])

keymap.set("x", "p", [["_dP]])
keymap.set({ "n", "v" }, "y", [["+y]])
keymap.set("n", "Y", [["+Y]])
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

keymap.set("v", "<Down>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<Up>", ":m '<-2<CR>gv=gv")

-- keymap.set({ "n", "v" }, "J", "5j")
-- keymap.set({ "n", "v" }, "K", "5k")

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<C-w>", "<cmd>bd<CR>")
keymap.set("n", "<C-w>!", "<cmd>bd!<CR>")

--// CMD LAZY LOADED PLUGINS \\--

-- Telescope
keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
keymap.set("n", "<leader>bb", "<CMD>Telescope buffers<CR>")
keymap.set("n", "<leader>of", "<CMD>Telescope oldfiles<CR>")
keymap.set("n", "<leader>lg", "<CMD>Telescope live_grep<CR>")
keymap.set("n", "<leader>lr", "<CMD>Telescope lsp_references bufnr=0<CR>")
-- keymap.set("n", "<leader>LR", "<CMD>Telescope lsp_references<CR>")
keymap.set("n", "<leader>ld", "<CMD>Telescope lsp_definitions<CR>")
keymap.set("n", "<leader>dd", "<CMD>Telescope diagnostics bufnr=0<CR>")
-- keymap.set("n", "<leader>DD", "<CMD>Telescope diagnostics<CR>")
keymap.set("n", "<leader>td", "<CMD>Telescope lsp_type_definition<CR>")

-- Telescope File Browser
keymap.set("n", "<C-b>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "Browse files" })

-- Oil
keymap.set("n", "<leader>-", vim.cmd.Oil)

-- Undotree
keymap.set("n", "U", vim.cmd.UndotreeToggle)

-- Obsidian
keymap.set("n", "<C-o>", vim.cmd.ObsidianQuickSwitch)
