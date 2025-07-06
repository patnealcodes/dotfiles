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

-- -- 0.11 Stuff
-- vim.lsp.enable({ "lua-language-server", "typescript-language-server", "pyright" })
--
-- vim.diagnostic.config({
--   virtual_text = { current_line = true }
-- })
-- -- 0.11 Stuff

require("lazy").setup({
  spec = "plugins",
  change_detection = { notify = false }
})
