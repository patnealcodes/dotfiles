local formatters = {
  "stylua",
  "prettierd",
  "isort",
  "black",
  "rustywind",
  "djlint",
}
local diagnostics = {
  "eslint_d",
  "pylint",
}
local ensure_installed = {}

for k, v in pairs(ensure_installed) do
  formatters[k] = v
end
for k, v in pairs(ensure_installed) do
  diagnostics[k] = v
end

return {
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = diagnostics,
      })
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    config = function()
      local null_ls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormattng", {})
      local sources = {}

      for _, formatter in ipairs(formatters) do
        table.insert(sources, null_ls.builtins.formatting[formatter])
      end
      for _, diagnostic in ipairs(diagnostics) do
        table.insert(sources, null_ls.builtins.diagnostics[diagnostic])
      end

      null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
              group = augroup,
              buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })

      vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)
    end,
  },
}
