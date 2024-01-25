return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'plenary',
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function ()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        path_display = { "truncate " },
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
        }
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension('harpoon')

    vim.keymap.set('n', '<leader>ff', builtin.find_files)
    vim.keymap.set('n', '<leader>bb', builtin.buffers)
    vim.keymap.set('n', '<leader>of', builtin.oldfiles)
    vim.keymap.set('n', '<leader>lg', builtin.live_grep)
  end
}
