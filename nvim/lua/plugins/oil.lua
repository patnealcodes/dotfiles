return {
  "stevearc/oil.nvim",
  dependencies = {},
  config = function()
    require("oil").setup({
      columns = {
        "permissions",
        { "size",  highlight = "OilCopy" },
        { "mtime", highlight = "OilDir" },
        "icon"
      },
      constrain_cursor = "name",
      default_file_explorer = true,
      delete_to_trash = false,
      float = {
        padding = 10,
      },
      keymaps = {
        ["<Esc>"] = "actions.close"
      },
      sort = {
        { "name", "asc" },
        { "type", "asc" },
      },
      view_options = {
        show_hidden = true
      },
    })

    vim.keymap.set("n", "-", "<cmd>Oil --float<cr>", { desc = "Open Oil in float mode" })
  end
}
