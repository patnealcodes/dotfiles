return {
  "nvim-telescope/telescope.nvim",
	dependencies = {
		"plenary",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
  config = function()
    local telescope = require("telescope")
local keymap = vim.keymap
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

keymap.set('n', '<leader>ff', builtin.find_files)
keymap.set('n', '<leader>of', builtin.oldfiles)
keymap.set('n', '<leader>fg', builtin.git_files)
keymap.set("n", "<leader>bb", builtin.buffers)
keymap.set('n', '<leader>lg', builtin.live_grep)
keymap.set('n', '<leader>gs', function()
  builtin.grep_string({ search = vim.fn.input("Grep ⇒ ") })
end)
keymap.set('n', '<leader>vh', builtin.help_tags)
keymap.set('n', '<leader>gff', builtin.git_files)
keymap.set('n', '<leader>fb', function ()
  telescope.extensions.file_browser.file_browser({ path="%:p:h", select_buffer="true" })
end)
  end
}
