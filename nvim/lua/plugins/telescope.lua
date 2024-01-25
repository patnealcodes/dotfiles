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
    local keymap = vim.keymap

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
        }
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension('harpoon')

    keymap.set('n', '<leader>ff', builtin.find_files)
    keymap.set('n', '<leader>bb', builtin.buffers)
    keymap.set('n', '<leader>of', builtin.oldfiles)
    keymap.set('n', '<leader>lg', builtin.live_grep)
    keymap.set("n", "<leader>lr", "<CMD>Telescope lsp_references bufnr=0<CR>")
    keymap.set("n", "<leader>lR", builtin.lsp_references)
    keymap.set("n", "<leader>ld", builtin.lsp_definitions)
    keymap.set("n", "<leader>dd", "<CMD>Telescope diagnostics bufnr=0<CR>")
    keymap.set("n", "<leader>DD", builtin.diagnostics)
    -- keymap.set("n", "gi", telescope.lsp_implementations)
    -- keymap.set("n", "gt", telescope.lsp_type_definition)
  end
}
