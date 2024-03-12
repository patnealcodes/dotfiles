return {
	"stevearc/oil.nvim",

	dependencies = { "devicons" },
	config = function()
		local oil = require("oil")
		vim.keymap.set("n", "_", "<CMD>Oil<CR>")
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
				["<C-s>"] = "actions.vsplit",
				["<C-t>"] = "actions.tabedit",
				["<C-x>"] = "actions.split",
				["<CR>"] = "actions.select",
				["<C-p>"] = "actions.preview",
				["<Esc>"] = "actions.close",
				["_"] = "actions.parent",
				["~"] = "actions.open_cwd",
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = false,
		})
	end,
}
