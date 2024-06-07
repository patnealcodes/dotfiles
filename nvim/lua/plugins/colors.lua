local set_up_hl_post_colorscheme_load = function()
	vim.api.nvim_set_hl(0, "lualine_a", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none", fg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = palette.highlight_med })
	vim.api.nvim_set_hl(0, "TelescopeFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
end
return {
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local nightfox = require("nightfox")
			nightfox.setup({
				transparent = true,
			})
			vim.cmd.colorscheme("duskfox")
			set_up_hl_post_colorscheme_load()
		end,
	},

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
	-- 	"folke/tokyonight.nvim",
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "storm",
	-- 			transparent = true,
	-- 			terminal_colors = true,
	-- 			styles = {
	-- 				comments = { italic = false },
	-- 				keywords = { italic = false },
	-- 				sidebars = "dark",
	-- 				floats = "dark",
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme tokyonight")
	-- 	end
	-- },

	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		local palette = require("rose-pine.palette")
	-- 		require("rose-pine").setup({
	-- 			disable_background = true,
	-- 			styles = {
	-- 				italic = false,
	-- 			},
	-- 			highlight_groups = {
	-- 				TelescopeBorder = { fg = palette.highlight_high, bg = "none" },
	-- 				TelescopeNormal = { bg = "none" },
	-- 				TelescopePromptNormal = { bg = "base" },
	-- 				TelescopeResultsNormal = { fg = "subtle", bg = "none" },
	-- 				TelescopeSelection = { fg = "text", bg = "base" },
	-- 				TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	-- 			},
	-- 		})
	--
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },

	-- {
	-- 	"wincent/base16-nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd([[colorscheme base16-gruvbox-dark-hard]])
	-- 		vim.o.background = 'dark'
	-- 		local bools = vim.api.nvim_get_hl(0, { name = 'Boolean' })
	-- 		vim.api.nvim_set_hl(0, 'Comment', bools)
	-- 		local marked = vim.api.nvim_get_hl(0, { name = 'PMenu' })
	-- 		vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter',
	-- 			{ fg = marked.fg, bg = marked.bg, ctermfg = marked.ctermfg, ctermbg = marked.ctermbg, bold = true })
	-- 	end
	-- },

	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "mocha",
	-- 			transparent_background = true,
	-- 			show_end_of_buffer = false,
	-- 			term_colors = true,
	-- 			no_italic = true,
	-- 			integrations = {
	-- 				cmp = true,
	-- 				gitsigns = true,
	-- 				treesitter = true,
	-- 				mini = {
	-- 					enabled = true,
	-- 					indentscope_color = "",
	-- 				},
	-- 			},
	-- 		})
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 		set_up_hl_post_colorscheme_load()
	-- 	end,
	-- },
}
