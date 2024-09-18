return {
  "stevearc/oil.nvim",
  cmd = "Oil",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    default_file_explorer = true,
    view_options = {
      show_hidden = true,
    },
    delete_to_trash = false,
    constrain_cursor = "name",
    columns = {
      "permissions",
      { "size",  highlight = "OilCopy" },
      { "mtime", highlight = "OilDir" },
      "icon",
    },
    float = {
      padding = 4,
      max_width = 175
    },
    sort = {
      { "name", "asc" },
      { "type", "asc" },
    },
    keymaps = {
      ["<C-c>"] = "actions.close",
      ["<Esc>"] = "actions.close",
      ["q"] = "actions.close",
    },
  },
}
