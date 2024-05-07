return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap

		keymap.set("n", "<leader>a", function()
			require("harpoon"):list():add()
		end, {})
		keymap.set("n", "<C-h>", function()
			require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
		end, {})
		keymap.set("n", "<C-j>", function()
			require("harpoon"):list():select(1)
		end, {})
		keymap.set("n", "<C-k>", function()
			require("harpoon"):list():select(2)
		end, {})
		keymap.set("n", "<C-l>", function()
			require("harpoon"):list():select(3)
		end, {})
		keymap.set("n", "<C-;>", function()
			require("harpoon"):list():select(4)
		end, {})
		keymap.set("n", "<C-'>", function()
			require("harpoon"):list():select(5)
		end, {})
	end,
}
