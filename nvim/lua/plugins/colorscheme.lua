return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        -- styles = {
        --   transparency = true,
        -- },
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
-- return {
--   "bluz71/vim-nightfly-colors",
--   name = "nightfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("nightfly")
--   end,
-- }

-- return {
--   "catppuccin/nvim",
--   name = "catppuccin",
--   priority = 1000,
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha"
--     })
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }

-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	name = "kanagawa",
-- 	priority = 1000,
-- 	config = function()
-- 		require("kanagawa").setup({
-- 			transparent = true,
-- 			-- theme = "dragon",
-- 			-- background = {
-- 			-- 	dark = "dragon",
-- 			-- 	light = "lotus",
-- 			-- },
-- 		})
-- 		vim.cmd.colorscheme("kanagawa")
-- 	end,
-- }

-- return {
--   "drewtempelmeyer/palenight.vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd.colorscheme("palenight")
--   end,
-- }

-- return {
--   "ayu-theme/ayu-vim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("ayu-vim").setup({
--       ayucolor = "mirage",
--     })
--     vim.cmd.colorscheme("ayu")
--   end,
-- }

-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("tokyonight").setup()
--       vim.cmd.colorscheme("tokyonight-night")
--     end,
--   },
-- }
