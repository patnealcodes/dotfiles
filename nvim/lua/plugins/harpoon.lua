return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local harpoon = require('harpoon')
		harpoon:setup({})

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers").new({}, {
				prompt_title = "Harpoon",
				finder = require("telescope.finders").new_table({
					results = file_paths,
				}),
				previewer = conf.file_previewer({}),
				sorter = conf.generic_sorter({}),
			}):find()
		end

		keymap.set("n", "<leader>ha", function()
			require("harpoon"):list():add()
		end, {})
		keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {})


		vim.keymap.set("n", "<leader>sh", function() toggle_telescope(harpoon:list()) end,
			{ desc = "Open harpoon window" })

		keymap.set("n", "<leader>^", function()
			require("harpoon"):list():select(1)
		end, {})

		keymap.set("n", "<leader>{", function()
			require("harpoon"):list():select(2)
		end, {})

		keymap.set("n", "<leader>[", function()
			require("harpoon"):list():select(3)
		end, {})

		keymap.set("n", "<leader>(", function()
			require("harpoon"):list():select(4)
		end, {})

		keymap.set("n", "<leader><", function()
			require("harpoon"):list():select(4)
		end, {})
	end,
}
