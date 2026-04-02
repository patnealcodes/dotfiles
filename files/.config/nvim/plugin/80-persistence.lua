vim.api.nvim_create_autocmd("BufReadPre", {
  once = true,
  callback = function()
    vim.cmd.packadd("persistence")
    require("persistence").setup({})
  end,
})
