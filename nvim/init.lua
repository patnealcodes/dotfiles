local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("patnc.init")
require("lazy").setup({
	{ import = "plugins" },
})

function Sad(line_nr, from, to, fname)
  vim.cmd(string.format("silent !sed -i '%ss/%s/%s/' %s", line_nr, from, to, fname)) 
end

function IncreasePadding() 
  Sad('07', 0, 20, '~/dotfiles/alacritty/alacritty.windows.yml')
  Sad('08', 0, 20, '~/dotfiles/alacritty/alacritty.windows.yml')
end

function DecreasePadding()
  Sad('07', 20, 0, '~/dotfiles/alacritty/alacritty.windows.yml')
  Sad('08', 20, 0, '~/dotfiles/alacritty/alacritty.windows.yml')
end

vim.cmd[[
  augroup ChangeAlacrittyPadding
   au! 
   au VimEnter * lua DecreasePadding()
   au VimLeavePre * lua IncreasePadding()
  augroup END 
]]
