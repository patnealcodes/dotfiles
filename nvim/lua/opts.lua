vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.copilot_enabled = false

vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true

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
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false
