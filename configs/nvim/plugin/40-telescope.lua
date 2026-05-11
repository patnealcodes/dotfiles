local actions = require("telescope.actions")
local telescope = require("telescope")

local exclude_folders = {
  ".git", "node_modules", ".venv"
}
local exclude_files = {
  ".DS_Store"
}

local function build_fd_exclude_args()
  local args = {}

  for _, folder in ipairs(exclude_folders) do
    vim.list_extend(args, { "--exclude", folder })
  end

  for _, file in ipairs(exclude_files) do
    vim.list_extend(args, { "--exclude", file })
  end

  return args
end

local function build_rg_hidden_args()
  local args = { "--hidden" }

  for _, folder in ipairs(exclude_folders) do
    vim.list_extend(args, { "--glob", "!**/" .. folder .. "/*" })
  end

  for _, file in ipairs(exclude_files) do
    vim.list_extend(args, { "--glob", "!**/" .. file })
  end

  return args
end

local fd_exclude_args = build_fd_exclude_args()
local rg_hidden_args = build_rg_hidden_args()

local function find_files_command(no_ignore)
  if vim.fn.executable("fd") == 1 then
    local command = { "fd", "--type", "f", "--hidden" }

    if no_ignore then
      table.insert(command, "--no-ignore")
    end

    return vim.list_extend(command, fd_exclude_args)
  end

  if vim.fn.executable("rg") == 1 then
    local command = { "rg", "--files" }

    if no_ignore then
      table.insert(command, "--no-ignore")
    end

    return vim.list_extend(command, rg_hidden_args)
  end
end

telescope.setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git/" },
    layout_strategy = 'flex',
    layout_config = {
      flex = {
        flip_columns = 200,
      }
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-x>"] = actions.delete_buffer,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-x>"] = actions.delete_buffer,
      },
    },
    path_display = {
      filename_first = {
        reverse_directories = false,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = true,
      find_command = find_files_command(false),
    },
    live_grep = {
      additional_args = rg_hidden_args,
    },
    grep_string = {
      additional_args = rg_hidden_args,
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
pcall(telescope.load_extension, "git_file_history")

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search files" })
vim.keymap.set("n", "<leader>saf", function()
  builtin.find_files({
    find_command = find_files_command(true),
    hidden = true,
  })
end, { desc = "Search all files" })
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
