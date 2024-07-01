local set_up_hl_post_colorscheme_load = function()
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "FloatTitle" })
  -- vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "LspSagaHoverBorder" })
  -- vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "FloatTitle" })
  -- vim.api.nvim_set_hl(0, "TelescopePromptBorder", { link = "LspSagaHoverBorder" })
  -- vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "IblScope", { link = "Statement" })
end
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "night",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark",              -- style for sidebars, see below
          floats = "dark",                -- style for floating windows
        },
        sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false,             -- dims inactive windows
        lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold
      })
      vim.cmd.colorscheme "tokyonight"
      set_up_hl_post_colorscheme_load()
    end
  },

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
  --     -- set_up_hl_post_colorscheme_load()
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
  --     -- set_up_hl_post_colorscheme_load()
  --   end,
  -- },

  -- {
  -- 	"AlexvZyl/nordic.nvim",
  -- 	lazy = false,
  -- 	priority = 1000,
  -- 	config = function()
  -- 		require("nordic").setup({
  -- 			transparent_bg = true,
  -- 		})
  -- 	end,
  -- },

  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     vim.cmd("colorscheme kanagawa-wave")
  --   end,
  -- },

  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   config = function()
  --     local palette = require "rose-pine.palette"
  --     require("rose-pine").setup {
  --       -- disable_background = true,
  --       styles = {
  --         italic = false,
  --       },
  --       highlight_groups = {
  --         TelescopeBorder = { fg = palette.highlight_high, bg = "none" },
  --         TelescopeNormal = { bg = "none" },
  --         TelescopePromptNormal = { bg = "base" },
  --         TelescopeResultsNormal = { fg = "subtle", bg = "none" },
  --         TelescopeSelection = { fg = "text", bg = "base" },
  --         TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
  --       },
  --     }
  --     vim.cmd "colorscheme rose-pine"
  --     set_up_hl_post_colorscheme_load()
  --   end,
  -- },

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
  --     -- set_up_hl_post_colorscheme_load()
  --   end,
  -- },
}
