return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<C-c>"] = "actions.close",
			["<Esc>"] = "actions.close",
			["q"] = "actions.close",
		},
	},
	dependencies = { "devicons" },
}
