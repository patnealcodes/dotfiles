vim.cmd "set noshowmode"

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.copilot_enabled = true

vim.opt.background = "dark"
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true
vim.opt.colorcolumn = "100"
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.pumheight = 10
vim.opt.isfname:append "@-@"
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.path:append { "**" }
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes:1"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.updatetime = 50
vim.opt.wrap = false

vim.opt.nu = true

-- fold logic
-- vim.g.markdown_folding = 1
-- vim.o.foldenable = false
-- vim.o.foldlevel = 99
-- vim.o.fillchars = 'fold:\\'
-- vim.o.foldtext = 'v:lua.CustomFoldText()'
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.GetPotionFold(v:lnum)'

-- -- Function to determine fold level based on the line number
-- function GetPotionFold(lnum)
--   local line = vim.fn.getline(lnum)
--   if line:match('^%s*$') then
--     return '-1'
--   end
--
--   local this_indent = IndentLevel(lnum)
--   local next_indent = IndentLevel(NextNonBlankLine(lnum))
--
--   if next_indent == this_indent then
--     return tostring(this_indent)
--   elseif next_indent < this_indent then
--     return tostring(this_indent)
--   else
--     return '>' .. tostring(next_indent)
--   end
-- end
--
-- -- Function to calculate the indentation level
-- function IndentLevel(lnum)
--   return vim.fn.indent(lnum) / vim.o.shiftwidth
-- end
--
-- -- Function to find the next non-blank line
-- function NextNonBlankLine(lnum)
--   local numlines = vim.fn.line('$')
--   local current = lnum + 1
--
--   while current <= numlines do
--     local line = vim.fn.getline(current)
--     if line:match('%S') then
--       return current
--     end
--     current = current + 1
--   end
--
--   return -2
-- end
--
-- -- Function to create custom fold text
-- function CustomFoldText()
--   local fs = vim.v.foldstart
--
--   while vim.fn.getline(fs):match('^%s*$') do
--     fs = vim.fn.nextnonblank(fs + 1)
--   end
--
--   local line
--   if fs > vim.v.foldend then
--     line = vim.fn.getline(vim.v.foldstart)
--   else
--     line = vim.fn.substitute(vim.fn.getline(fs), '\t', string.rep(' ', vim.o.tabstop), 'g')
--   end
--
--   local w = vim.fn.winwidth(0) - vim.wo.foldcolumn - (vim.wo.number and 8 or 0)
--   local foldSize = 1 + vim.v.foldend - vim.v.foldstart
--   local foldSizeStr = "     «" .. foldSize .. " lines folded»"
--   local foldLevelStr = string.rep("+--", vim.v.foldlevel)
--   local expansionString = string.rep(" ", w - vim.fn.strwidth(foldSizeStr .. foldLevelStr))
--   return line .. foldSizeStr .. expansionString .. foldLevelStr
-- end
