return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"plenary",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
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

		vim.keymap.set("n", "<leader><leader>", function() toggle_telescope(harpoon:list()) end,
			{ desc = "Open harpoon window" })

		vim.keymap.set("n", "<leader>a", function()
			require("harpoon"):list():add()
		end, { desc = "Add/edit mark in current file to harpoon" })
		vim.keymap.set("n", "∆", function()
			require("harpoon"):list():select(1)
		end, { desc = "Open harpoon mark 1" })
		vim.keymap.set("n", "˚", function()
			require("harpoon"):list():select(2)
		end, { desc = "Open harpoon mark 2" })
		vim.keymap.set("n", "¬", function()
			require("harpoon"):list():select(3)
		end, { desc = "Open harpoon mark 3" })
		vim.keymap.set("n", "…", function()
			require("harpoon"):list():select(4)
		end, { desc = "Open harpoon mark 4" })
		vim.keymap.set("n", "æ", function()
			require("harpoon"):list():select(5)
		end, { desc = "Open harpoon mark 5" })
	end,
}
