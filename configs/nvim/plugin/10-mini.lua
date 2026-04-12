require("mini.ai").setup({ n_lines = 500 })
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.pairs").setup()

local statusline = require("mini.statusline")

statusline.mylsp = function()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #buf_clients == 0 then
    return "LSP Inactive"
  end

  local buf_client_names = {}
  for _, client in pairs(buf_clients) do
    if client.name ~= "GitHub Copilot" then
      table.insert(buf_client_names, client.name)
    end
  end

  return string.format("[%s]", table.concat(buf_client_names, ", "))
end

statusline.setup({
  use_icons = true,
  content = {
    active = function()
      local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })

      return statusline.combine_groups({
        { hl = mode_hl, strings = { mode } },
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
