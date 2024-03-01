return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	dependencies = { "devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			columns = {
				"icon",
			},
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name)
					return name == "node_modules"
				end,
			},
			float = {
				max_height = 40,
				max_width = 100,
			},
			keymaps = {
				["<CR>"] = "actions.select",
				["<C-p>"] = "actions.preview",
				["<Esc>"] = "actions.close",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = "actions.tcd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g\\"] = "actions.toggle_trash",
			},
		})
	end,
}
