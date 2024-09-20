return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"css",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"scss",
				"sql",
				"rust",
				"typescript",
				"tsx",
				"vim",
				"vimdoc",
			},
			sync_install = false,
			auto_install = true,
			indent = {
				enable = true
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		})
	end
}
