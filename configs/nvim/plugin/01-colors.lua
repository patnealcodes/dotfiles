-- NOTE: Color schemes are loaded with all plugins in `00-pack-start.lua`

require("teide").setup({
  transparent = true,
  on_highlights = function(hl, c)
    hl.GitBlameInline          = { fg = "#3c404f", bg = "none" }
    hl.TelescopeBorder         = { fg = c.border_highlight, bg = c.bg_float }
    hl.TelescopeNormal         = { fg = c.fg, bg = c.bg_float }
    hl.TelescopePromptBorder   = { fg = c.orange, bg = c.bg_float }
    hl.TelescopePromptTitle    = { fg = c.orange, bg = c.bg_float }
    hl.TelescopeResultsComment = { fg = c.dark3 }
  end,
})

vim.cmd.colorscheme("teide-dimmed")
