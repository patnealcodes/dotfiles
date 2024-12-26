local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, " ")
      local args = { "rg" }

      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten({
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },

      })
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd
  })

  pickers.new(opts, {
    debounce = 100,
    prompt_title = "Multi Grep",
    finder = finder,
    previewer = conf.grep_previewer(opts),
    sorter = require("telescope.sorters").empty(),
  }):find()
end

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
        file_ignore_patterns = {
          ".git",
          "*/node_modules"
        }
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
          show_untracked = true
        }
      }
    })

    local builtin = require("telescope.builtin")

    key('n', '<leader><leader>', builtin.buffers, { desc = "[S]earch Buffers []" })
    key('n', '<leader>d', builtin.diagnostics, { desc = "[S]earch [d]iagnostics" })
    key('n', '<leader>gd', builtin.lsp_definitions, { desc = "[G]o to [d]efinitions" })
    key('n', '<leader>gr', builtin.lsp_references, { desc = "[G]o to [r]eferences" })
    key('n', '<leader>sf', function()
      builtin.find_files({ hidden = false, no_ignore = false })
    end, { desc = "[S]earch [f]iles" })
    key('n', '<leader>saf', function()
      builtin.find_files({ hidden = true, no_ignore = true })
    end, { desc = "[S]earch [a]ll [f]iles" })
    key('n', '<leader>sr', builtin.resume, { desc = "[S]earch [r]esume" })
    key("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch Help [?]" })
    key("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [k]eymaps" })
    key("n", "<leader>sb", builtin.builtin, { desc = "[S]earch [b]uiltin" })
    key("n", "<leader>sqf", builtin.quickfix, { desc = "[S]earch [q]uick[f]ix" })
    key("n", "<leader>sqh", builtin.quickfixhistory, { desc = "[S]earch [q]uickfix [h]istory" })
    key('n', '<leader>sg', live_multigrep, { desc = "[S]earch with [g]rep" })
    key('n', '<leader>sw', function()
      builtin.grep_string({ search = vim.fn.expand("<cword>") })
    end, { desc = "[S]earch for [w]ord" })
    key('n', '<leader>sW', function()
      builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
    end, { desc = "[S]earch for [W]ORD" })
  end
}
