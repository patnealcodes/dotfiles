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

  -- {
  --   "Mofiqul/dracula.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local dracula = require("dracula")
  --     local colors = {
  --       bg = "#22212C",
  --       bg_light = "#2E2B3B",
  --       bg_lighter = "#393649",
  --       fg = "#F8F8F2",
  --       selection = "#454158",
  --       comment = "#7970A9",
  --       red = "#FF9580",
  --       orange = "#FFCA80",
  --       yellow = "#FFFF80",
  --       green = "#8AFF80",
  --       purple = "#9580FF",
  --       cyan = "#80FFEA",
  --       pink = "#FF80BF",
  --       bright_red = "#FF6E6E",
  --       bright_green = "#69FF94",
  --       bright_yellow = "#FFFFA5",
  --       bright_blue = "#D6ACFF",
  --       bright_magenta = "#FF92DF",
  --       bright_cyan = "#A4FFFF",
  --       bright_white = "#FFFFFF",
  --       menu = "#21222C",
  --       visual = "#3E4452",
  --       gutter_fg = "#4B5263",
  --       nontext = "#3B4048",
  --     }
  --     dracula.setup({
  --       -- customize dracula color palette
  --       colors = colors,
  --       -- show the '~' characters after the end of buffers
  --       show_end_of_buffer = false,   -- default false
  --       -- use transparent background
  --       transparent_bg = true,        -- default false
  --       -- set custom lualine background color
  --       lualine_bg_color = "#44475a", -- default nil
  --       -- set italic comment
  --       italic_comment = true,        -- default false
  --       -- overrides the default highlights see `:h synIDattr`
  --       overrides = {
  --         -- https://github.com/Mofiqul/dracula.nvim/blob/main/lua/dracula/groups.lua
  --         Comment = { fg = colors.comment, italic = true },
  --         Constant = { fg = colors.yellow, italic = true },
  --         Keyword = { fg = colors.cyan, italic = true },
  --         DiagnosticUnderlineError = { fg = colors.red, italic = true, underline = true },
  --         Special = { fg = colors.green },
  --         ['@keyword'] = { fg = colors.pink, italic = true },
  --         ['@keyword.function'] = { fg = colors.pink },
  --         ['@keyword.conditional'] = { fg = colors.pink, italic = true },
  --         ['@variable.member'] = { fg = colors.purple },
  --         ['@variable.parameter'] = { fg = colors.orange, italic = true },
  --         ['@constant'] = { fg = colors.purple, italic = true },
  --         ['@type'] = { fg = colors.bright_cyan, italic = true },
  --         ['@number'] = { fg = colors.purple, italic = true },
  --         ['@lsp.type.parameter'] = { fg = colors.orange, italic = true },
  --         NvimTreeNormal = { fg = colors.fg, bg = colors.bg_light, },
  --         -- CmpItemAbbr = { fg = colors.white, bg = colors.bg_light },
  --         -- CmpItemKind = { fg = colors.white, bg = colors.bg_light },
  --         NormalFloat = { fg = colors.fg, bg = colors.bg_light, },
  --         TelescopeNormal = { fg = colors.fg, bg = colors.bg_light, },
  --         TelescopePromptBorder = { fg = colors.cyan, },
  --         TelescopeResultsBorder = { fg = colors.cyan, },
  --         TelescopePreviewBorder = { fg = colors.cyan, },
  --         FloatBorder = { fg = colors.cyan, },
  --         VertSplit = { fg = colors.cyan, },
  --         WinSeparator = { fg = colors.cyan, },
  --       },
  --     })
  --     -- Colorscheme
  --     vim.cmd [[colorscheme dracula]]
  --     set_up_hl_post_colorscheme_load()
  --   end
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "night",
  --       transparent = true,
  --       terminal_colors = true,
  --       styles = {
  --         comments = { italic = true },
  --         keywords = { italic = true },
  --         functions = {},
  --         variables = {},
  --         sidebars = "dark",
  --         floats = "dark",
  --       },
  --       sidebars = { "qf", "help" },
  --       hide_inactive_statusline = true,
  --       dim_inactive = true,
  --       lualine_bold = false,
  --     })
  --     vim.cmd.colorscheme "tokyonight"
  --     set_up_hl_post_colorscheme_load()
  --   end
  -- },

  -- {
  --   "EdenEast/nightfox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     local nightfox = require "nightfox"
  --     nightfox.setup {
  --       options = {
  --         transparent = true,
  --       },
  --     }
  --     vim.cmd.colorscheme "nightfox"
  --     set_up_hl_post_colorscheme_load()
  --   end,
  -- },

  -- {
  --   "navarasu/onedark.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('onedark').setup {
  --       -- Main options --
  --       style = 'darker',             -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  --       transparent = true,           -- Show/hide background
  --       term_colors = true,           -- Change terminal color as per the selected theme style
  --       ending_tildes = false,        -- Show the end-of-buffer tildes. By default they are hidden
  --       cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
  --
  --       -- toggle theme style ---
  --       toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }, -- List of styles to toggle between
  --
  --       -- Change code style ---
  --       -- Options are italic, bold, underline, none
  --       -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
  --       code_style = {
  --         comments = 'italic',
  --         keywords = 'none',
  --         functions = 'none',
  --         strings = 'none',
  --         variables = 'none'
  --       },
  --
  --       -- Lualine options --
  --       lualine = {
  --         transparent = false, -- lualine center bar transparency
  --       },
  --
  --       -- Custom Highlights --
  --       colors = {},     -- Override default colors
  --       highlights = {}, -- Override highlight groups
  --
  --       -- Plugins Config --
  --       diagnostics = {
  --         darker = true,     -- darker colors for diagnostic
  --         undercurl = true,  -- use undercurl instead of underline for diagnostics
  --         background = true, -- use background color for virtual text
  --       },
  --     }
  --     vim.cmd.colorscheme "onedark"
  --     set_up_hl_post_colorscheme_load()
  --   end,
  -- },

  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").setup({
  --       transparent_bg = true,
  --     })
  --
  --     set_up_hl_post_colorscheme_load()
  --   end,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     vim.cmd("colorscheme kanagawa-wave")
  --   end,
  -- },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      local palette = require "rose-pine.palette"
      require("rose-pine").setup {
        styles = {
          italic = false,
        },
        -- highlight_groups = {
        --   TelescopeBorder = { fg = palette.highlight_high, bg = "none" },
        --   TelescopeNormal = { bg = "none" },
        --   TelescopePromptNormal = { bg = "base" },
        --   TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        --   TelescopeSelection = { fg = "text", bg = "base" },
        --   TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
        -- },
      }
      vim.cmd "colorscheme rose-pine"
      set_up_hl_post_colorscheme_load()
    end,
  },

  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = true, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
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
  --     vim.cmd("colorscheme gruvbox")
  --   end
  -- },

  -- {
  --   "lunarvim/Onedarker.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme onedarker")
  --   end
  -- },

  -- {
  --   "wincent/base16-nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
  --     vim.o.background = 'dark'
  --     local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
  --     vim.api.nvim_set_hl(0, 'Comment', bools)
  --     local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
  --     vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter',
  --       { fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
  --   end
  -- },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     require("catppuccin").setup {
  --       flavour = "mocha",
  --       transparent_background = true,
  --       show_end_of_buffer = false,
  --       term_colors = true,
  --       no_italic = true,
  --       integrations = {
  --         cmp = true,
  --         gitsigns = true,
  --         treesitter = true,
  --         mini = {
  --           enabled = true,
  --           indentscope_color = "",
  --         },
  --       },
  --     }
  --     vim.cmd.colorscheme "catppuccin"
  --     set_up_hl_post_colorscheme_load()
  --   end,
  -- },

}
