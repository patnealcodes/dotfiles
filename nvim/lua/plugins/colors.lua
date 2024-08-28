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
  -- update_hl_values("NvimTreeNormal", { bg = "none" })
  -- update_hl_values("NvimTreeNormalNC", { bg = "none" })

  -- update_hl_values("CursorLine", { bg = "none" })
  -- update_hl_values("CursorLineNr", { bg = "none" })
  update_hl_values("SignColumn", { bg = "none" })
  update_hl_values("LineNr", { bg = "none" })
end

return {

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        terminal_colors = true,
        hide_inactive_statusline = true,
        lualine_bold = false,
      })
      vim.cmd.colorscheme "tokyonight"
      -- set_up_hl_post_colorscheme_load()
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
  --     -- update_hl_values("telescopeborder", { fg = "#9cc7d8" })
  --     -- update_hl_values("telescopetitle", { link = "@comment.info" })
  --     -- update_hl_values("telescopeprompttitle", { link = "macro" })
  --     -- update_hl_values("telescopepromptborder", { fg = "#c4a7e7" })
  --     -- update_hl_values("ColorColumn", { bg = "#333333" })
  --     -- update_hl_values("TreesitterContextLineNumber", { bg = "#333333" })
  --     -- update_hl_values("TreesitterContext", { bg = "#333333" })
  --     -- update_hl_values("TelescopeSelection", { bg = "#333333" })
  --     -- vim.api.nvim_set_hl(0, "CursorLineNr", { link = "boolean" })
  --   end,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("kanagawa").setup({
  --       theme = "wave",
  --       transparent = true,
  --       terminalColors = true,
  --       dimInactive = true,
  --     })
  --     vim.cmd.colorscheme "kanagawa"
  --     set_up_hl_post_colorscheme_load()
  --   end
  -- },

}
