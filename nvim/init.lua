vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.keymap.set({'i', 'v'}, 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '^') 
vim.keymap.set('n', '<C-l>', '$') 
vim.keymap.set('c', '<C-j>', '<Down>') 
vim.keymap.set('c', '<C-k>', '<Up>') 
vim.keymap.set('n', '<Down>', '<C-d>') 
vim.keymap.set('n', '<Up>', '<C-u>') 

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = { "bash", "lua", "vim", "javascript", "typescript", "regex", "tsx", "html", "css", "scss", "python" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})

require("catppuccin").setup({
  transparent_background = true
})
vim.cmd.colorscheme "catppuccin"

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
