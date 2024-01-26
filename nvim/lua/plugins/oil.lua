return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	dependencies = { "devicons" },
	config = function()
		require("oil").setup({
			keymaps = {
				["<CR>"] = "actions.select",
				--["<C-s>"] = "actions.select_vsplit",
				--["<C-h>"] = "actions.select_split",
				["<C-t>"] = "actions.select_tab",
				["<C-p>"] = "actions.preview",
				["<Esc>"] = "actions.close",
				--["<C-l>"] = "actions.refresh",
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
