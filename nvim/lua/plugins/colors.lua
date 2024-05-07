return {
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = true,
	-- 			terminal_colors = true,
	-- 			styles = {
	-- 				comments = { italic = false },
	-- 				keywords = { italic = false },
	-- 			},
	-- 			dim_inactive = true,
	-- 		})
	--
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end,
	-- },

	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			disable_background = true,
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 		})
	--
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },

	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local C = require("nordic.colors.nordic")
			require("nordic").load({
				italic_comments = false,
				transparent_bg = true,
				bright_border = true,
				override = {
					TreesitterContext = { bg = C.black0 },
				},
				cursorline = {
					bold = false,
					bold_number = true,
					theme = "light",
				},
				telescope = {
					style = "classic",
				},
			})
		end,
	},

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha",
	-- 			transparent_background = true,
	-- 			italics = false,
	-- 		})
	--
	-- 		vim.cmd("colorscheme catppuccin")
	-- 	end,
	-- },
}
