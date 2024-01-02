return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local keymap = vim.keymap

		local function find_git_root()
			local current_file = vim.api.nvim_buf_get_name(0)
			local current_dir
			local cwd = vim.fn.getcwd()

			if current_file == "" then
				current_dir = cwd
			else
				current_dir = vim.fn.fnamemodify(current_file, ":h")
			end

			local git_root =
				vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
			if vim.v.shell_error ~= 0 then
				print("Not a git repository. Searching on current working directory")
				return cwd
			end
			return git_root
		end

		local function live_grep_git_root()
			local git_root = find_git_root()
			if git_root then
				require("telescope.builtin").live_grep({
					search_dirs = { git_root },
				})
			end
		end

		vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				initial_mode = "normal",
			},
			pickers = {
				live_grep = {
					initial_mode = "insert",
				},
				find_files = {
					initial_mode = "insert",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				file_browser = {
					hijack_netrw = true,
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("file_browser")

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set(
			"n",
			"<leader>gg",
			"<cmd>LiveGrepGitRoot<CR>",
			{ desc = "Find string in root of nearest git project" }
		)
		keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<cr>", { desc = "View open buffers" })
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
			{ desc = "Browse files" }
		)
	end,
}
