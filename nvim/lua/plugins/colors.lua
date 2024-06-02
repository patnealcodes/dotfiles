return {
	-- {
	-- 	'sainnhe/gruvbox-material',
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		-- Optionally configure and load the colorscheme
	-- 		-- directly inside the plugin declaration.
	-- 		vim.g.gruvbox_material_enable_italic = true
	-- 		vim.cmd.colorscheme('gruvbox-material')
	-- 	end
	-- },

	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				require("rose-pine").setup({
					highlight_groups = {
						TelescopeBorder = { fg = "highlight_high", bg = "none" },
						TelescopeNormal = { bg = "none" },
						TelescopePromptNormal = { bg = "base" },
						TelescopeResultsNormal = { fg = "subtle", bg = "none" },
						TelescopeSelection = { fg = "text", bg = "base" },
						TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
					},
				})
			})

			vim.cmd("colorscheme rose-pine")
		end
	}

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
	-- 			transparent_background = false,
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
	-- 		vim.cmd.colorscheme "catppuccin"
	-- 	end
	-- }
}
