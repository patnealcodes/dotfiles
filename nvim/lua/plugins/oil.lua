return {
  "stevearc/oil.nvim",
  opts = {
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
  dependencies = { "echasnovski/mini.nvim" },
}
