local togglescope_config = {
	find_files = {
		["<leader>g."] = {
			hidden = true,
			togglescope_title = "Find Files (Hidden)",
		},
	},
	live_grep = {
		["<leader>g."] = {
			hidden = true,
			togglescope_title = "Live Grep (Hidden)",
		},
	},
}

return {
	"nvim-telescope/telescope-ui-select.nvim",
	{
		"nvim-telescope/telescope.nvim",

		tag = "0.1.5",

		dependencies = {

			"Theo-Steiner/togglescope",
			"plenary",
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

			local previewers = require("telescope.previewers")
			local sorters = require("telescope.sorters")
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					},
					togglescope = togglescope_config,
				},
				defaults = {
					winblend = 0,
					file_ignore_patterns = { "^.git/" },
					layout_strategy = "vertical",
					dynamic_preview_title = true,
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
					},
					path_display = filenameFirst,
				},
				pickers = {
					live_grep = {
						only_sort_text = true,
					},
					grep_string = {
						only_sort_text = true,
					},
					buffers = {
						initial_mode = "normal",
						mappings = {
							i = {
								["<C-x>"] = "delete_buffer",
							},
							n = {
								["dd"] = "delete_buffer",
							},
						},
					},
					planets = {
						show_pluto = true,
						show_moon = true,
					},
					git_files = {
						hidden = true,
						show_untracked = true,
					},
					colorscheme = {
						enable_preview = true,
					},
				},
				file_previewer = previewers.vim_buffer_cat.new,
				grep_previewer = previewers.vim_buffer_vimgrep.new,
				qflist_previewer = previewers.vim_buffer_qflist.new,
				file_sorter = sorters.get_fuzzy_file,
				generic_sorter = sorters.get_generic_fuzzy_sorter,
			})
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", function()
				require("telescope").extensions.togglescope.find_files()
			end, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", function()
				require("telescope").extensions.togglescope.live_grep({
					sorting_strategy = "ascending",
					layout_strategy = "bottom_pane",
					prompt_prefix = ">> ",
					prompt_title = "Live Grep",
				})
			end)
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>hsf", function()
				builtin.find_files({ hidden = true })
			end, { desc = "([H]idden)[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>hsg", function()
				vim.ui.input({ prompt = "Grep (including hidden) > " }, function(input)
					if input ~= nil then
						builtin.grep_string({ search = input, hidden = true })
					end
				end)
			end, { desc = "([H]idden)[S]earch by [G]rep" })

			vim.keymap.set("n", "<leader>vh", builtin.help_tags, {})
			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "<leader>d", builtin.diagnostics, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension('harpoon')
		end,
	},
}
