return {
  "nvim-mini/mini.nvim",
  config = function()
    require("mini.ai").setup({ n_lines = 500 })
    require("mini.surround").setup()
    require("mini.pairs").setup()
    local statusline = require("mini.statusline")

    statusline.mylsp = function()
      local buf_clients = vim.lsp.get_clients { bufnr = 0 }
      if #buf_clients == 0 then
        return "LSP Inactive"
      end

      local buf_client_names = {}
      local copilot_active = false

      for _, client in pairs(buf_clients) do
        if client.name ~= "GitHub Copilot" then
          table.insert(buf_client_names, client.name)
        end

        if client.name == "GitHub Copilot" then
          copilot_active = true
        end
      end

      local unique_client_names = table.concat(buf_client_names, ", ")
      local language_servers = string.format("[%s]", unique_client_names)

      if copilot_active then
        language_servers = language_servers
      end

      return language_servers
    end

    local format_summary = function(data)
      local summary = vim.b[data.buf].minigit_summary
      vim.b[data.buf].minigit_summary_string = summary.head_name or ''
    end

    local au_opts = { pattern = 'MiniGitUpdated', callback = format_summary }
    vim.api.nvim_create_autocmd('User', au_opts)

    statusline.setup({
      use_icons = true,
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

          return statusline.combine_groups({
            { hl = mode_hl,                  strings = { mode } },
            { hl = "MiniStatuslineFileinfo", strings = { statusline.section_git({}) } },
            { hl = "MiniStatuslineFilename", strings = { statusline.section_filename({ trunc_width = 2000 }) } },
            "%=",
            { strings = { statusline.section_diagnostics({}) } },
            { strings = { statusline.mylsp() } },
          })
        end,
        inactive = function()
          local filename = statusline.section_filename({ trunc_width = 140 })
          return statusline.combine_groups({
            "%=",
            { hl = "MiniStatuslineFilename", strings = { filename } },
          })
        end,
      },
    })

    require("mini.files").setup({
      mappings = {
        close       = '<C-c>',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
        mark_goto   = "'",
        mark_set    = 'm',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
      },
      windows = {
        max_number = 4, -- Maximum number of windows to show side by side
        preview = false, -- Whether to show preview of file/directory under cursor
        width_focus = 25, -- Width of focused window
        width_nofocus = 25, -- Width of non-focused window
      },
    })

    require("mini.git").setup({

    })
  end,
}
