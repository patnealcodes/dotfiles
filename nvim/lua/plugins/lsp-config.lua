return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        "lua_ls",
        "tsserver"
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      local on_attach = function()
        local keymap = vim.keymap

        keymap.set('n', 'K', vim.lsp.buf.hover)
        keymap.set("n", "gD", vim.lsp.buf.declaration)
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
        keymap.set("n", "[d", vim.diagnostic.goto_prev)
        keymap.set("n", "]d", vim.diagnostic.goto_next)
        keymap.set("n", "<leader>rs", ":LspRestart<CR>")
      end

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach
      })

    end
  }
}
