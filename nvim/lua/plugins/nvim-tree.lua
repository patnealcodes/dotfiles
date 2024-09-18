local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return {
      desc = desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true
    }
  end

  vim.keymap.set('n', '*', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', 'K', api.node.show_info_popup, opts('Info'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<C-p>', api.node.open.preview_no_picker, opts('Open Preview'))
  vim.keymap.set('n', '}', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', '}', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
  vim.keymap.set('n', '_', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create File Or Directory'))
  vim.keymap.set('n', 'bD', api.marks.bulk.delete, opts('Delete Bookmarked'))
  vim.keymap.set('n', 'bM', api.marks.bulk.move, opts('Move Bookmarked'))
  vim.keymap.set('n', 'yy', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'x', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
  vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
  vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'ya', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', 'yb', api.fs.copy.basename, opts('Copy Basename'))
  vim.keymap.set('n', '^', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', '$', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'H', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<Esc>', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<leader>rn', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', '/', api.tree.search_node, opts('Search'))
  vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', 'd', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'yn', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'yr', api.fs.copy.relative_path, opts('Copy Relative Path'))

  -- Filters
  vim.keymap.set('n', 'F', api.live_filter.clear, opts('Live Filter: Clear'))
  vim.keymap.set('n', 'f', api.live_filter.start, opts('Live Filter: Start'))
  vim.keymap.set('n', 'gb', api.tree.toggle_no_buffer_filter, opts('Toggle Filter: No Buffer'))
  vim.keymap.set('n', 'gg', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))
  vim.keymap.set('n', 'gm', api.tree.toggle_no_bookmark_filter, opts('Toggle Filter: No Bookmark'))
  vim.keymap.set('n', 'g.', api.tree.toggle_custom_filter, opts('Toggle Filter: Hidden'))
end

return {
  "nvim-tree/nvim-tree.lua",
  cmd = "NvimTreeToggle",
  config = function()
    require("nvim-tree").setup({
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
          show = {
            git = false
          }
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = function()
          local WIDTH_RATIO = 0.3 -- 30%
          local MAX_WIDTH = 40
          local auto_width = math.floor(vim.opt.columns:get() * WIDTH_RATIO)
          return (auto_width < MAX_WIDTH and auto_width or MAX_WIDTH)
        end,
      },
      filters = {
        dotfiles = true
      },
      on_attach = on_attach,
      hijack_directories = {
        enable = false,
        auto_open = false
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        update_root = false,
      },
    })
  end,
}
