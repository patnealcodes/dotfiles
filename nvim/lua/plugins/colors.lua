 return {
     'AlexvZyl/nordic.nvim',
     lazy = false,
     priority = 1000,
     config = function()
       local C = require 'nordic.colors.nordic'
       require('nordic').load {
         italic_comments = true,
         transparent_bg = true,
         bright_border = true,
         override = {
           TreesitterContext = { bg = C.black0 },
         },
         cursorline = {
           bold = false,
           bold_number = true,
           theme = 'light',
         },
         telescope = {
           style = 'classic',
         },
       }
     end,
 }
-- function ColorMyPencils(color)
-- 	color = color or "rose-pine"
-- 	vim.cmd.colorscheme(color)
--
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
-- end
--
-- return {
--     {
--         "folke/tokyonight.nvim",
--         config = function()
--             require("tokyonight").setup({
--                 style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--                 transparent = true, -- Enable this to disable setting the background color
--                 terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
--                 styles = {
--                     comments = { italic = false },
--                     keywords = { italic = false },
--                     sidebars = "dark", -- style for sidebars, see below
--                     floats = "dark", -- style for floating windows
--                 },
--             })
--         end
--     },
--
--     {
--         "rose-pine/neovim",
--         name = "rose-pine",
--         config = function()
--             require('rose-pine').setup({
--                 disable_background = true,
--                 styles = {
--                     italic = false,
--                 },
--             })
--
--             vim.cmd("colorscheme rose-pine")
--
--             ColorMyPencils()
--         end
--     },
--
--
-- }
