return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ['<C-x>'] = actions.delete_buffer
          },
          n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ['<C-x>'] = actions.delete_buffer
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search grep" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search word" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search help" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search keymaps" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search diagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search resume" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search recent files" })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>/", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "Fuzzy search buffer" })
  end,
}
