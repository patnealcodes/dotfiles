local update_hl_values = function(hl_group, hl_values)
  local current_values = vim.api.nvim_get_hl(0, { name = hl_group })
  vim.api.nvim_set_hl(0, hl_group, vim.tbl_extend("force", current_values, hl_values))
end

return {
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
      styles = {
        sidebars = "transparent",
        floats = "transparent"
      }
    })

    vim.cmd("colorscheme tokyonight")
    update_hl_values("GitBlameInline", { fg = "#2d3144" })
  end
}
