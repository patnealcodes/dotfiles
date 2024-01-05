return {
  "nvim-telescope/telescope.nvim",
	dependencies = {
		"plenary",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    
    telescope.setup({
      defaults = {
        path_display = { "truncate" },
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

    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
    vim.keymap.set('n', '<leader>fg', builtin.git_files)
		vim.keymap.set("n", "<leader>ob", "<cmd>Telescope buffers<cr>")
    vim.keymap.set('n', '<leader>lg', builtin.live_grep)
    vim.keymap.set('n', '<leader>gs', function()
      builtin.grep_string({ search = vim.fn.input("gimee > ") })
    end)
    vim.keymap.set('n', '<leader>vh', builtin.help_tags)
    vim.keymap.set('n', '<leader>gg', builtin.git_files)
    vim.keymap.set('n', '<leader>fb', "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>")
  end
}
