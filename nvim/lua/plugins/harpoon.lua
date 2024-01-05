return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"plenary",
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
		keymap.set("n", "<C-1>", function()
			harpoon:list():select(1)
		end, {})
		keymap.set("n", "<C-2>", function()
			harpoon:list():select(2)
		end, {})
		keymap.set("n", "<C-3>", function()
			harpoon:list():select(3)
		end, {})
		keymap.set("n", "<C-4>", function()
			harpoon:list():select(4)
		end, {})
	end,
}

