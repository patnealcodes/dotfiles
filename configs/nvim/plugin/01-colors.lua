--// NOTE: Color schemes are loaded with all plugins in `00-pack-start.lua`

-- require("catppuccin").setup({
--   custom_highlights = function(colors)
--     return {
--       GitBlameInline          = { fg = "#3c404f" },
--       TelescopeResultsComment = { fg = "#3c404f", bg = "none" },
--       TelescopeSelection      = { link = "TelescopePreviewLine" },
--       TelescopeNormal         = { bg = colors.base },
--       TelescopeBorder         = { fg = colors.blue, bg = colors.base },
--       TelescopePromptNormal   = { bg = colors.base },
--       TelescopePromptBorder   = { fg = colors.blue, bg = colors.base },
--       TelescopeResultsNormal  = { bg = colors.base },
--       TelescopeResultsBorder  = { fg = colors.blue, bg = colors.base },
--       TelescopePreviewNormal  = { bg = colors.base },
--       TelescopePreviewBorder  = { fg = colors.blue, bg = colors.base },
--       TelescopeTitle          = { fg = colors.mauve, bg = colors.base },
--       TelescopePromptTitle    = { fg = colors.mauve, bg = colors.base },
--       TelescopeResultsTitle   = { fg = colors.mauve, bg = colors.base },
--       TelescopePreviewTitle   = { fg = colors.mauve, bg = colors.base },
--     }
--   end,
--   float = {
--     transparent = true,
--     solid = false,
--   },
--   integrations = {
--     diffview = true,
--     harpoon = true,
--     mason = true,
--     native_lsp = { enabled = true },
--     symbols_outline = true,
--     snacks = {
--       enabled = true,
--       indent_scope_color = "mauve",
--     },
--     render_markdown = true,
--     oil = true,
--     telescope = true,
--     treesitter = true,
--     treesitter_context = true,
--   },
--   transparent_background = true,
-- })
-- vim.cmd.colorscheme("catppuccin-macchiato")

require("tokyonight").setup({
  on_highlights = function(hl)
    hl.GitBlameInline = { fg = "#3c404f" }
  end,
  transparent = true,
  styles = {
    floats = ""
  },
})
vim.cmd.colorscheme("tokyonight-night")
