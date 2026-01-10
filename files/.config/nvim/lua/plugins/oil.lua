return {
  "stevearc/oil.nvim",
  lazy = false,
  config = function()
    local permission_hlgroups = {
      ['-'] = 'NonText',
      ['r'] = 'DiagnosticSignWarn',
      ['w'] = 'DiagnosticSignError',
      ['x'] = 'DiagnosticSignOk',
    }
    local oil = require("oil")
    oil.setup({
      columns = {
        {
          'permissions',
          highlight = function(permission_str)
            local hls = {}
            for i = 1, #permission_str do
              local char = permission_str:sub(i, i)
              table.insert(hls, { permission_hlgroups[char], i - 1, i })
            end
            return hls
          end,
        },
        { 'size',  highlight = 'Special' },
        { 'mtime', highlight = 'Number' },
        {
          'icon',
          -- default_file = icon_file,
          -- directory = icon_dir,
          add_padding = false,
        },
      },
      win_options = {
        number = false,
        relativenumber = false,
        signcolumn = 'no',
        foldcolumn = '0',
        statuscolumn = '',
      },
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-v>"] = "actions.select_vsplit",
        ["<C-s>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<Esc>"] = "actions.close",
        ["<C-r>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
      },
    })
    vim.keymap.set("n", "-", function()
      oil.open_float(nil, nil, function()
        oil.open_preview({ vertical = true })
      end)
    end, { desc = "Open Oil in float mode with delayed vertical preview" })
  end,
}
