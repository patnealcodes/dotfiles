return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "plenary",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")

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

    local keymap = vim.keymap
    keymap.set('n', '<leader>ff', require("telescope.builtin").find_files)
    keymap.set('n', '<leader>of', require("telescope.builtin").oldfiles)
    keymap.set('n', '<leader>fg', require("telescope.builtin").git_files)
    keymap.set("n", "<leader>bb", require("telescope.builtin").buffers)
    keymap.set('n', '<leader>lg', require("telescope.builtin").live_grep)
    keymap.set('n', '<leader>gs', function()
      require("telescope.builtin").grep_string({ search = vim.fn.input("Grep ⇒ ") })
    end)
    keymap.set('n', '<leader>vh', require("telescope.builtin").help_tags)
    keymap.set('n', '<leader>gff', require("telescope.builtin").git_files)
    keymap.set('n', '<leader>fb', function ()
      require("telescope").extensions.file_browser.file_browser({ path="%:p:h", select_buffer="true" })
    end)
  end
}
