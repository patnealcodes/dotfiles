vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.cursorline = false
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.number = true
vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.shortmess:append("c")
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = (os.getenv("HOME") or "") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false
vim.opt.isfname:append("@-@")

local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function()
  return hover({
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  })
end
