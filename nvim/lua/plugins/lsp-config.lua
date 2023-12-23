return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "pyright", "jsonls", "gopls", "cssls", "tailwindcss", "rust_analyzer"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.gopls.setup({})
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})

      vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover)
      vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition)
      vim.keymap.set({ 'n' }, '<leader>ca', vim.lsp.buf.code_action)
    end
  }
}
