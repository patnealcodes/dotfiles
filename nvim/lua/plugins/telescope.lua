return {
	"nvim-telescope/telescope.nvim",

	tag = "0.1.5",

	dependencies = {
		"nvim-lua/plenary.nvim"
	},

	config = function()
		local function filenameFirst(_, path)
			local tail = vim.fs.basename(path)
			local parent = vim.fs.dirname(path)
			if parent == "." then
				return tail
			end
			return string.format("%s\t\t%s", tail, parent)
		end

		require('telescope').setup({
			defaults = {
				winblend = 0,
				layout_strategy = "vertical",
				dynamic_preview_title = true,
				path_display = filenameFirst,
			},
			pickers = {
				live_grep = { only_sort_text = true, },
				grep_string = { only_sort_text = true, },
				colorscheme = { enable_preview = true, },
				buffers = {
					mappings = {
						n = { ["<x>"] = "delete_buffer", },
					},
				},
				git_files = {
					hidden = true,
					show_untracked = true,
				},
			},
		})

		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [f]iles" })
		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = "[S]earch Buffers []" })
		vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = "[S]earch [r]esume" })
		vim.keymap.set('n', '<leader>d', builtin.diagnostics, { desc = "[S]earch [d]iagnostics" })
		vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, { desc = "[G]o to [d]efinitions" })
		vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = "[G]o to [r]eferences" })
		vim.keymap.set("n", "<leader>s?", builtin.help_tags, { desc = "[S]earch Help [?]" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [k]eymaps" })
		vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [b]uiltin" })
		vim.keymap.set('n', '<leader>sg', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "[S]earch [s]elect Telescope" })
		vim.keymap.set('n', '<leader>sw', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "[S]earch for [w]ord" })
		vim.keymap.set('n', '<leader>sW', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "[S]earch for [W]ORD" })
	end
}
