return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")


    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)

      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)

      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)

      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format { async = true }
      end, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end


    local capabilities = cmp_nvim_lsp.default_capabilities()


    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
    })

    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {

          diagnostics = {
            globals = { "vim" },
          },
          workspace = {

            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
