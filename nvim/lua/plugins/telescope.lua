return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local key = vim.keymap.set
    local function filenameFirst(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then
        return tail
      end

      return string.format("%s\t\t%s", tail, parent)
    end

    require("telescope").setup({
      defaults = {
        winblend = 0,
        layout_strategy = "vertical",
        dynamic_preview_title = true,
        path_display = filenameFirst,
      },
      pickers = {
        live_grep = { only_sort_text = true },
        grep_string = { only_sort_text = true },
        colorscheme = { enable_preview = true },
        buffers = {
          mappings = {
            n = { ["x"] = "delete_buffer" },
          }
        },
        git_files = {
          hidden = true,
          show_untracked = true
        }
      }
    })

    local builtin = require("telescope.builtin")

    key('n', '<leader><leader>', builtin.buffers, { desc = "[S]earch Buffers []" })
    key('n', '<leader>d', builtin.diagnostics, { desc = "[S]earch [d]iagnostics" })
    key('n', '<leader>gd', builtin.lsp_definitions, { desc = "[G]o to [d]efinitions" })
    key('n', '<leader>gr', builtin.lsp_references, { desc = "[G]o to [r]eferences" })
    key('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [f]iles" })
    key('n', '<leader>sr', builtin.resume, { desc = "[S]earch [r]esume" })
    key("n", "<leader>s?", builtin.help_tags, { desc = "[S]earch Help [?]" })
    key("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [k]eymaps" })
    key("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [b]uiltin" })
    key('n', '<leader>sg', function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = "[S]earch [s]elect Telescope" })
    key('n', '<leader>sw', function()
      builtin.grep_string({ search = vim.fn.expand("<cword>") })
    end, { desc = "[S]earch for [w]ord" })
    key('n', '<leader>sW', function()
      builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
    end, { desc = "[S]earch for [W]ORD" })
  end
}
