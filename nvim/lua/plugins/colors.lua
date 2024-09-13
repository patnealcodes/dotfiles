local update_hl_values = function(hl_group, hl_values)
  local current_values = vim.api.nvim_get_hl(0, { name = hl_group })
  vim.api.nvim_set_hl(0, hl_group, vim.tbl_extend("force", current_values, hl_values))
end

return {

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",
  --       transparent = true,
  --       terminal_colors = true,
  --       hide_inactive_statusline = true,
  --       lualine_bold = false,
  --       styles = {
  --         sidebars = "transparent",
  --         floats = "transparent"
  --       }
  --     })
  --
  --     vim.cmd("colorscheme tokyonight")
  --     update_hl_values("GitBlameInline", { fg = "#2d3144" })
  --     update_hl_values("TreesitterContext", { link = "ColorColumn" })
  --   end
  -- }

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local theme = require('kanagawa')
      theme.setup({
        compile = true,
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        colors = {
          palette = {
            samuraiRed = "#C34043", -- Color Palette: autumnRed
            fujiGray = "#54546D",   -- Color Palette: sumiInk4
          }
        },
        overrides = function()
          return {
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
            NvimTreeCursorLine = { bg = "#363646" },
            SignColumn = { bg = "none" },
            LineNr = { bg = "none" },
            GitBlameInline = { fg = "#363646" }
          }
        end,
        theme = "dragon",
      })
      vim.cmd("colorscheme kanagawa")
    end,
  }

}
