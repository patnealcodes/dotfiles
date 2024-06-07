vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.copilot_enabled = true
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
-- vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.pumheight = 10

vim.opt.isfname:append("@-@")
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.path:append({ "**" })
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false
