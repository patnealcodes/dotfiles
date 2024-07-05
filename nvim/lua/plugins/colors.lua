local set_up_hl_post_colorscheme_load = function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Bold" })
  vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "Character" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "Bold" })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "Character" })
  vim.api.nvim_set_hl(0, "IblScope", { link = "Statement" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        sidebars = { "qf", "help" },
        hide_inactive_statusline = false,
        lualine_bold = false,
      })
      vim.cmd.colorscheme "tokyonight"
      set_up_hl_post_colorscheme_load()
    end
  },
}
