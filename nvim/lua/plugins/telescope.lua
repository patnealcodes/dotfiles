
return
  {
    {

      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' },

      config = function()
        local telescope = require('telescope')
        local actions = require('telescope.actions')
        local builtin = require('telescope.builtin')
        telescope.setup({
          defaults = {
            file_ignore_patterns = {'node_modules'},
            path_display = {'truncate'},
            mappings = {
              i = {
                ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                ["<C-j>"] = actions.move_selection_next, -- move to next result
                ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              },
            },
          },
        })
        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>gf', builtin.git_files)
        vim.keymap.set('n', '<leader>lg', builtin.live_grep)
        vim.keymap.set('n', "<leader>fr", builtin.oldfiles)
        vim.keymap.set('n', "<leader>fs", builtin.live_grep)
        vim.keymap.set('n', "<leader>fc", builtin.grep_string)
      end
    },
    {
      "nvim-telescope/telescope-ui-select.nvim",
      config = function()
        require("telescope").setup {
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {}
            }
          }
        }
        require("telescope").load_extension("ui-select")
      end
    }
  }
