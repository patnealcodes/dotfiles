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
  update_hl_values("WinBar", { bg = "none" })
  update_hl_values("NormalFloat", { bg = "none" })
  update_hl_values("TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })

  -- -- // Style Updates
  update_hl_values("FloatBorder", { bg = "none" })
  update_hl_values("TelescopeBorder", { bg = "none" })
  update_hl_values("TelescopeTitle", { bg = "none" })
  update_hl_values("TelescopePromptBorder", { bg = "none" })
  update_hl_values("TelescopePromptTitle", { bg = "none" })
  update_hl_values("CursorLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "IblScope", { link = "Statement" })
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",
        transparent = true,
        terminal_colors = true,
        sidebars = { "qf", "help" },
        hide_inactive_statusline = false,
        lualine_bold = false,
      })
      vim.cmd.colorscheme "tokyonight"
      set_up_hl_post_colorscheme_load()
    end
  },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     require("rose-pine").setup {
  --       transparent_background = true,
  --       styles = {
  --         italic = false,
  --       },
  --     }
  --     vim.cmd "colorscheme rose-pine"
  --     vim.api.nvim_set_hl(0, "FloatBorder", { link = "Macro" })
  --     vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Macro" })
  --     vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "@diff.delta" })
  --     vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "Macro" })
  --     vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "@diff.delta" })
  --     set_up_hl_post_colorscheme_load()
  --   end,
  -- },

}
