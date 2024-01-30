return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				styles = {
					transparency = true,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
}

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
-- 	{
-- 		"folke/tokyonight.nvim",
-- 		lazy = false,
-- 		priority = 1000,
-- 		config = function()
-- 			require("tokyonight").setup({
-- 				transparent = true,
-- 			})
-- 			vim.cmd.colorscheme("tokyonight-storm")
-- 		end,
-- 	},
-- }
