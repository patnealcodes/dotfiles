--// NOTE: Color schemes are loaded with all plugins in `00-pack-start.lua`

-- require("teide").setup({
--   transparent = true,
--   on_highlights = function(hl, c)
--     hl.GitBlameInline          = { fg = "#3c404f", bg = "none" }
--     hl.TelescopeBorder         = { fg = c.border_highlight, bg = c.bg_float }
--     hl.TelescopeNormal         = { fg = c.fg, bg = c.bg_float }
--     hl.TelescopePromptBorder   = { fg = c.orange, bg = c.bg_float }
--     hl.TelescopePromptTitle    = { fg = c.orange, bg = c.bg_float }
--     hl.TelescopeResultsComment = { fg = c.dark3 }
--   end,
-- })
--
-- vim.cmd.colorscheme("teide-dimmed")

require("catppuccin").setup({
  float = {
  	transparent = true,
  	solid = false,
  },
  integrations = {
    diffview = true,
    harpoon = true,
    mason = true,
    native_lsp = { enabled = true },
    symbols_outline = true,
    snacks = {
      enabled = true,
      indent_scope_color = "mauve",
    },
    render_markdown = true,
    oil = true,
    telescope = true,
    treesitter = true,
    treesitter_context = true,
  },
  custom_highlights = function(colors)
    return {
      GitBlameInline         = { fg = "#3c404f", bg = "none" },
      TelescopeNormal        = { bg = colors.base },
      TelescopeBorder        = { fg = colors.blue, bg = colors.base },
      TelescopePromptNormal  = { bg = colors.base },
      TelescopePromptBorder  = { fg = colors.blue, bg = colors.base },
      TelescopeResultsNormal = { bg = colors.base },
      TelescopeResultsBorder = { fg = colors.blue, bg = colors.base },
      TelescopePreviewNormal = { bg = colors.base },
      TelescopePreviewBorder = { fg = colors.blue, bg = colors.base },
      TelescopeTitle         = { fg = colors.mauve, bg = colors.base },
      TelescopePromptTitle   = { fg = colors.mauve, bg = colors.base },
      TelescopeResultsTitle  = { fg = colors.mauve, bg = colors.base },
      TelescopePreviewTitle  = { fg = colors.mauve, bg = colors.base },
    }
  end
})

vim.cmd.colorscheme("catppuccin-mocha")
