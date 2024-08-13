-- // Update individual values of a highlight group without clearing unspecified values
local update_hl_values = function(hl_group, hl_values)
  local current_values = vim.api.nvim_get_hl(0, { name = hl_group })
  vim.api.nvim_set_hl(0, hl_group, vim.tbl_extend("force", current_values, hl_values))
end

local set_up_hl_post_colorscheme_load = function()
  -- -- // Transparency tweaks
  update_hl_values("Normal", { bg = "none" })
  update_hl_values("NormalNC", { bg = "none" })
  update_hl_values("Float", { bg = "none" })
  update_hl_values("FloatBorder", { bg = "none" })
  update_hl_values("WinBar", { bg = "none" })
  update_hl_values("NormalFloat", { bg = "none" })
  update_hl_values("TelescopeNormal", { bg = "none" })
  update_hl_values("TelescopeBorder", { bg = "none" })
  update_hl_values("TelescopeTitle", { bg = "none" })
  update_hl_values("TelescopePromptBorder", { bg = "none" })
  update_hl_values("TelescopePromptTitle", { bg = "none" })

  update_hl_values("CursorLine", { bg = "none" })
  update_hl_values("CursorLineNr", { bg = "none" })
  -- update_hl_values("SignColumn", { bg = "none" })
end

return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   name = "gruvbox",
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = false, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = false,
  --       bold = false,
  --       italic = {
  --         strings = false,
  --         emphasis = false,
  --         comments = false,
  --         operators = false,
  --         folds = false,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true, -- invert background for search, diffs, statuslines and errors
  --       contrast = "",  -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = false,
  --     })
  --     vim.cmd.colorscheme "gruvbox"
  --     -- set_up_hl_post_colorscheme_load()
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,
        sidebars = { "qf", "help" },
        hide_inactive_statusline = false,
        lualine_bold = false,
      })
      vim.cmd.colorscheme "tokyonight"
      -- set_up_hl_post_colorscheme_load()
      -- update_hl_values("ColorColumn", { link = "TreesitterContext" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
    end
  },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require('rose-pine').setup({
  --       disable_background = true,
  --       styles = {
  --         italic = false,
  --       },
  --     })
  --     vim.cmd "colorscheme rose-pine"
  --     set_up_hl_post_colorscheme_load()
  --     update_hl_values("telescopeborder", { fg = "#9cc7d8" })
  --     update_hl_values("telescopetitle", { link = "@comment.info" })
  --     update_hl_values("telescopeprompttitle", { link = "macro" })
  --     update_hl_values("telescopepromptborder", { fg = "#c4a7e7" })
  --     update_hl_values("ColorColumn", { bg = "#333333" })
  --     update_hl_values("TreesitterContextLineNumber", { bg = "#333333" })
  --     update_hl_values("TreesitterContext", { bg = "#333333" })
  --     update_hl_values("TelescopeSelection", { bg = "#333333" })
  --     vim.api.nvim_set_hl(0, "CursorLineNr", { link = "boolean" })
  --   end,
  -- },

}
