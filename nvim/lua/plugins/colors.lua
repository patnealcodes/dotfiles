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
  TelescopeTitle = { link = "Character" },
  TelescopePromptBorder = { bg = "none" },
  TelescopePromptTitle = { link = "Character" },
  NvimTreeNormal = { bg = "none" },
  NvimTreeNormalNC = { bg = "none" },
  LineNr = { bg = "none" },
  NvimTreeCursorLine = { bg = "#363646" },
  SignColumn = { bg = "none" },
  GitBlameInline = { fg = "#2d3144", bg = "none" },
  CursorLine = { bg = "none" }
}

return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('nightfox').setup({
      options = {
        transparent = true,
        terminal_colors = true,
        dim_inactive = true,
      },
      groups = {
        all = override_groups
      },
    })
    vim.cmd("colorscheme nightfox")
  end
}
