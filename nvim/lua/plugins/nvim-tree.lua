return {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  config = function()
    local status, nvim_tree = pcall(require, "nvim-tree")
    if not status then
      return
    end
    local WIDTH_RATIO = 0.3
    local HEIGHT_RATIO = 0.925
    local OFFSET = 3

    local function on_attach(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- Default Keymaps
      vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
      vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
      vim.keymap.set('n', 'e', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', '}', api.node.navigate.sibling.next, opts('Next Sibling'))
      vim.keymap.set('n', '{', api.node.navigate.sibling.prev, opts('Previous Sibling'))
      vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
      vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
      vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
      vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
      vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
      vim.keymap.set('n', 'C', api.tree.toggle_git_clean_filter, opts('Toggle Git Clean'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
      vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
      vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
      vim.keymap.set('n', '<Esc>', api.live_filter.clear, opts('Clean Filter'))
      vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
      vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
      vim.keymap.set('n', 'g.', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
      vim.keymap.set('n', 'gi', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
      vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
      vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
      vim.keymap.set('n', 'H', api.node.navigate.parent, opts('Parent Directory'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
      vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'gh', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
      vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
      vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
    end

    nvim_tree.setup({
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
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
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
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
        side = "right",
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)

            -- adjust for the offset
            local col_right_aligned = screen_w - window_w_int - OFFSET
            local row_offset = OFFSET - 3

            return {
              border = 'rounded',
              relative = 'editor',
              row = row_offset,
              col = col_right_aligned,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        }
      },
    })
  end
}
