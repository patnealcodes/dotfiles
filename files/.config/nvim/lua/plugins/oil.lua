return {
  "stevearc/oil.nvim",
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    local oil = require("oil")
    oil.setup({
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
        preview_split = "below"
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

    vim.keymap.set("n", "-", function()
      oil.open_float(nil, nil, function()
        oil.open_preview({ horizontal = true })
      end)
    end, { desc = "Open Oil in float mode with delayed horizontal preview" })
  end
}
