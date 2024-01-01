return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local harpoon = require("harpoon")

		keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, {})
		keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {})
		keymap.set("n", "<C-J>", function()
			harpoon:list():select(1)
		end, {})
		keymap.set("n", "<C-K>", function()
			harpoon:list():select(2)
		end, {})
		keymap.set("n", "<C-L>", function()
			harpoon:list():select(3)
		end, {})
		keymap.set("n", "<C-:>", function()
			harpoon:list():select(4)
		end, {})
	end,
}
