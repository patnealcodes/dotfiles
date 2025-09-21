return {
  "nvim-telescope/telescope.nvim",

  tag = "0.1.5",

  dependencies = {
    "nvim-lua/plenary.nvim"
  },

  config = function()
    require('telescope').setup({
      defaults = {
        winblend = 0,
        layout_strategy = "vertical",
        file_ignore_patterns = {
          "node_modules/.*",
          "%.git/.*",
          "dist/.*",
          "build/.*",
          "target/.*",
          "%.DS_Store",
          "%.pyc",
          "__pycache__/.*",
          "%.o",
          "%.so",
          "%.dylib",
          "%.class",
          "%.jar",
          "%.war",
          "%.zip",
          "%.tar%.gz",
          "%.log",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
        },
        live_grep = {
          additional_args = function()
            return {"--hidden", "--no-ignore"}
          end,
        },
        grep_string = {
          additional_args = function()
            return {"--hidden", "--no-ignore"}
          end,
        },
      }
    })

    local key = vim.keymap.set
    local builtin = require("telescope.builtin")

    key('n', '<leader><leader>', builtin.buffers, { desc = "[S]earch Buffers []" })
    key('n', '<leader>d', builtin.diagnostics, { desc = "[S]earch [d]iagnostics" })
    key('n', '<leader>gd', builtin.lsp_definitions, { desc = "[G]o to [d]efinitions" })
    key('n', '<leader>gr', builtin.lsp_references, { desc = "[G]o to [r]eferences" })
    key('n', '<leader>sf', builtin.find_files, { desc = "[S]earch [f]iles" })
    key('n', '<leader>saf', function()
        builtin.find_files({
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {}
        })
      end,
      { desc = "[S]earch [a]bsolutely all [f]iles" })
    key('n', '<leader>sr', builtin.resume, { desc = "[S]earch [r]esume" })
    key("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch Help [?]" })
    key("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [k]eymaps" })
    key("n", "<leader>sb", builtin.builtin, { desc = "[S]earch [b]uiltin" })
    key("n", "<leader>sqf", builtin.quickfix, { desc = "[S]earch [q]uick[f]ix" })
    key("n", "<leader>sqh", builtin.quickfixhistory, { desc = "[S]earch [q]uickfix [h]istory" })
    key("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch live [g]rep" })
    key("n", "<leader>sag", function()
        builtin.live_grep({
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {},
          additional_args = {"--hidden", "--no-ignore", "--no-ignore-global"}
        })
      end,
      { desc = "[S]earch [a]bsolutely all live [g]rep" })
    key('n', '<leader>sw', function()
      builtin.grep_string({ search = vim.fn.expand("<cword>") })
    end, { desc = "[S]earch for [w]ord" })
    key('n', '<leader>sW', function()
      builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
    end, { desc = "[S]earch for [W]ORD" })
  end
}
