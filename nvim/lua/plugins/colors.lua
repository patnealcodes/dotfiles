local update_hl_values = function(hl_group, hl_values)
  local current_values = vim.api.nvim_get_hl(0, { name = hl_group })
  vim.api.nvim_set_hl(0, hl_group, vim.tbl_extend("force", current_values, hl_values))
end

local override_groups = {
  Normal = { bg = "none" },
  NormalNC = { bg = "none" },
  Float = { bg = "none" },
  FloatBorder = { bg = "none" },
  WinBar = { bg = "none" },
  NormalFloat = { bg = "none" },
  TelescopeNormal = { bg = "none" },
  TelescopeBorder = { bg = "none" },
  TelescopeTitle = { bg = "none" },
  TelescopePromptBorder = { bg = "none" },
  TelescopePromptTitle = { bg = "none" },
  NvimTreeNormal = { bg = "none" },
  NvimTreeNormalNC = { bg = "none" },
  LineNr = { bg = "none" },
  NvimTreeCursorLine = { bg = "#363646" },
  SignColumn = { bg = "none" },
}

return {

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        hide_inactive_statusline = true,
        lualine_bold = false,
        styles = override_groups,
      })
      vim.cmd("colorscheme tokyonight")
      update_hl_values("TreesitterContext", { link = "ColorColumn" })
      update_hl_values("CursorLine", { bg = "None" })
    end
  },

  -- {
  --   "Mofiqul/dracula.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local colors = {
  --       bg = "#22212C",
  --       bg_light = "#2E2B3B",
  --       bg_lighter = "#393649",
  --       fg = "#F8F8F2",
  --       selection = "#454158",
  --       comment = "#7970A9",
  --       red = "#FF9580",
  --       orange = "#FFCA80",
  --       yellow = "#FFFF80",
  --       green = "#8AFF80",
  --       purple = "#9580FF",
  --       cyan = "#80FFEA",
  --       pink = "#FF80BF",
  --       bright_red = "#FF6E6E",
  --       bright_green = "#69FF94",
  --       bright_yellow = "#FFFFA5",
  --       bright_blue = "#D6ACFF",
  --       bright_magenta = "#FF92DF",
  --       bright_cyan = "#A4FFFF",
  --       bright_white = "#FFFFFF",
  --       menu = "#21222C",
  --       visual = "#3E4452",
  --       gutter_fg = "#4B5263",
  --       nontext = "#3B4048",
  --     }
  --     require('dracula').setup({
  --       colors = colors,
  --       show_end_of_buffer = false,
  --       lualine_bg_color = "#44475a",
  --       italic_comment = true,
  --       overrides = {
  --         Normal = { bg = "none" },
  --         NormalNC = { bg = "none" },
  --         Float = { bg = "none" },
  --         WinBar = { bg = "none" },
  --         TelescopeBorder = { bg = "none" },
  --         TelescopeTitle = { bg = "none" },
  --         TelescopePromptTitle = { bg = "none" },
  --         NvimTreeNormalNC = { bg = "none" },
  --         CursorLine = { link = "clear" },
  --         Comment = { fg = colors.comment, italic = true },
  --         Constant = { fg = colors.yellow, italic = true },
  --         Keyword = { fg = colors.cyan, italic = true },
  --         DiagnosticUnderlineError = { fg = colors.red, italic = true, underline = true },
  --         Special = { fg = colors.green },
  --         ['@keyword'] = { fg = colors.pink, italic = true },
  --         ['@keyword.function'] = { fg = colors.pink },
  --         ['@keyword.conditional'] = { fg = colors.pink, italic = true },
  --         ['@variable.member'] = { fg = colors.purple },
  --         ['@variable.parameter'] = { fg = colors.orange, italic = true },
  --         ['@constant'] = { fg = colors.purple, italic = true },
  --         ['@type'] = { fg = colors.bright_cyan, italic = true },
  --         ['@number'] = { fg = colors.purple, italic = true },
  --         ['@lsp.type.parameter'] = { fg = colors.orange, italic = true },
  --         NvimTreeNormal = { fg = colors.fg, bg = "none" },
  --         CmpItemAbbr = { fg = colors.white },
  --         CmpItemKind = { fg = colors.white },
  --         NormalFloat = { fg = colors.fg, bg = "none" },
  --         TelescopeNormal = { fg = colors.fg, bg = "none" },
  --         TelescopePromptBorder = { fg = colors.cyan, bg = "none" },
  --         TelescopeResultsBorder = { fg = colors.cyan, bg = "none" },
  --         TelescopePreviewBorder = { fg = colors.cyan, bg = "none" },
  --         FloatBorder = { fg = colors.cyan, bg = "none" },
  --         VertSplit = { fg = colors.cyan, },
  --         WinSeparator = { fg = colors.cyan, },
  --         GitBlameInline = { fg = "#363646" },
  --       },
  --     })
  --     vim.cmd [[colorscheme dracula]]
  --   end
  -- }

  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('nightfox').setup({
  --       options = {
  --         transparent = true,
  --         terminal_colors = true,
  --         dim_inactive = true,
  --       },
  --       groups = {
  --         all = override_groups
  --       },
  --     })
  --     vim.cmd("colorscheme carbonfox")
  --   end
  -- }
}
