vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.cot = { "menu", "menuone", "noselect" } -- insert mode completion options
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.expandtab = true
vim.opt.isfname:append("@-@")
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.nu = true
vim.opt.pumheight = 10
vim.opt.relativenumber = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shiftwidth = 2
vim.opt.shm:append "c" -- short message - don't give ins-completion-menu messages
vim.opt.softtabstop = 2
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

local hover = vim.lsp.buf.hover
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.buf.hover = function()
  return hover({
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  })
end

vim.diagnostic.config {
  float = { border = "rounded" },
}
