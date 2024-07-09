local set_up_hl_post_colorscheme_load = function()
  -- -- // Transparency tweaks
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "Float", { bg = "none" })
  vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeSelection", { link = "Visual" })

  -- -- // Style Updates
  vim.api.nvim_set_hl(0, "FloatBorder", { link = "Statement" })
  vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "@attribute" })
  vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "@class" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "@attribute" })
  vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "@class" })
  vim.api.nvim_set_hl(0, "IblScope", { link = "Statement" })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
end

return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup {
        transparent_background = true,
        styles = {
          italic = false,
        },
      }
      vim.cmd "colorscheme rose-pine"
      set_up_hl_post_colorscheme_load()
    end,
  },
}
