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
  -- NvimTreeCursorLine = { bg = "#363646" },
  TreesitterContext = { bg = "#3c404f" },
  -- TreesitterContextBottom = { gui = "underline" },
  -- TreesitterContextLineNumberBottom = { gui = "underline" }
  SignColumn = { bg = "none" },
  GitBlameInline = { fg = "#3c404f", bg = "none" },
  CursorLine = { bg = "none" }
}

return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require('rose-pine').setup({
      disable_background = true,
      styles = {
        italic = false,
      },
      highlight_groups = override_groups
    })

    vim.cmd.colorscheme("rose-pine-moon")
  end
}
