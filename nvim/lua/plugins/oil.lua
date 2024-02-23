return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = { "devicons" },
  config = function()
    local oil = require("oil");
    oil.setup({
      default_file_explorer = true,
      columns = {
        "size",
        "mtime",
        "permissions",
        "icon",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
          return name == "node_modules"
        end,
      },
      keymaps = {
        ["<CR>"] = "actions.select",
        ["<C-p>"] = "actions.preview",
        ["<Esc>"] = "actions.close",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g\\"] = "actions.toggle_trash",
        ["C-f"] = oil.toggle_float
      },
    })
  end,
}
