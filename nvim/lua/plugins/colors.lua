return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = false,
			show_end_of_buffer = false,
			term_colors = true,
			no_italic = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd.colorscheme "catppuccin"
	end
}
