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
end

return {

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("tokyonight").setup({
  --       style = "moon",
  --       -- transparent = true,
  --       terminal_colors = true,
  --       -- sidebars = { "qf", "help" },
  --       hide_inactive_statusline = false,
  --       lualine_bold = false,
  --     })
  --     vim.cmd.colorscheme "tokyonight"
  --     vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
  --   end
  -- },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
      vim.cmd "colorscheme rose-pine-moon"
      set_up_hl_post_colorscheme_load()
      vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = "#9cc7d8" })
      vim.api.nvim_set_hl(0, "TelescopeTitle", { link = "@comment.info" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { link = "@comment.hint" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = "#c4a7e7" })
      vim.api.nvim_set_hl(0, "CursorLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "CursorLineNr", { link = "boolean" })

      update_hl_values("FloatBorder", { bg = "none" })
      update_hl_values("TelescopeBorder", { bg = "none" })
      update_hl_values("TelescopeTitle", { bg = "none" })
      update_hl_values("TelescopePromptBorder", { bg = "none" })
      update_hl_values("TelescopePromptTitle", { bg = "none" })

      update_hl_values("ColorColumn", { bg = "#373737" })
      update_hl_values("TelescopeSelection", { bg = "#373737" })
    end,
  },

  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("cyberdream").setup({
  --       -- Enable transparent background
  --       transparent = true,
  --
  --       -- Enable italics comments
  --       italic_comments = false,
  --
  --       -- Replace all fillchars with ' ' for the ultimate clean look
  --       hide_fillchars = false,
  --
  --       -- Modern borderless telescope theme
  --       -- borderless_telescope = true,
  --
  --       -- Set terminal colors used in `:terminal`
  --       terminal_colors = true,
  --
  --       theme = {
  --         variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
  --         highlights = {
  --           Comment = { fg = "#696969", bg = "NONE", italic = true },
  --         },
  --
  --         colors = {
  --           magenta = "#86e1fc",
  --         },
  --         overrides = function(colors) -- NOTE: This function nullifies the `highlights` option
  --           -- Example:
  --           return {
  --             -- Comment = { fg = colors.green, bg = "NONE", italic = true },
  --             ["@property"] = { fg = colors.magenta, bold = true },
  --           }
  --         end,
  --
  --       },
  --
  --       -- Disable or enable colorscheme extensions
  --       extensions = {
  --         telescope = true,
  --         mini = true,
  --         -- lualine = true
  --       },
  --     })
  --     vim.cmd "colorscheme cyberdream"
  --   end
  -- },
}
