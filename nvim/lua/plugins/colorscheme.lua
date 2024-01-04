return {
	-- "bluz71/vim-nightfly-colors",
	-- priority = 1000,
	-- name = "nightfly",
	-- config = function()
	-- 	vim.g.nightflyTransparent = true
	--
	-- 	vim.cmd([[colorscheme nightfly]])
	--
	-- 	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#1d3b53", bold = true })
	-- 	vim.api.nvim_set_hl(0, "LineNr", { fg = "#9ca1aa", bold = true })
	-- 	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#1d3b53", bold = true })
	-- end,
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {},
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
		})
		vim.cmd([[colorscheme catppuccin]])
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#9ca1aa", bold = true })
		vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#1d3b53", bold = true })
		vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#1d3b53", bold = true })
	end,
}
