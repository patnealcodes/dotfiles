return {
	"nvim-telescope/telescope-ui-select.nvim",
	{
		"nvim-telescope/telescope.nvim",

		tag = "0.1.5",

		dependencies = {
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

			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({})
					}
				},
				defaults = {
					winblend = 0,
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
					mappings = {
						i = {
							["<c-enter>"] = "to_fuzzy_refine",
						},
					},
				},
				pickers = {
					buffers = {
						sort_lastused = true,
						mappings = {
							i = {
								["<c-x>"] = "delete_buffer",
							},
							n = {
								["<c-x>"] = "delete_buffer",
							},
						},
					},
				},
			})
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", function()
				vim.ui.input({ prompt = "Grep > " }, function(input)
					if input ~= nil then
						builtin.grep_string({ search = input })
					end
				end)
			end)
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

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
		end,

	},
}
