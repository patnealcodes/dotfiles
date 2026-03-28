require("teide").setup({
  style = "darker",
  transparent = true,
  on_highlights = function(hl)
    hl.GitBlameInline = { fg = "#3c404f", bg = "none" }
  end,
})

vim.cmd.colorscheme("teide-darker")
