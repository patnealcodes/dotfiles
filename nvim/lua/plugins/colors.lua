return {
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
            CursorLine = { bg = "none" },
            CursorLineNr = { bg = "none" },
            SignColumn = { bg = "none" },
            LineNr = { bg = "none" },
            GitBlameInline = { fg = "#363646" }
          }
        end,
        theme = "wave",
      })
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
