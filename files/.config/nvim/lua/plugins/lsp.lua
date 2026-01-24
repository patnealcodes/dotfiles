return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim",    opts = {} },
    { "folke/lazydev.nvim",   ft = "lua", opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } } },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
        map("gr", require("telescope.builtin").lsp_references, "Goto references")
        map("gI", require("telescope.builtin").lsp_implementations, "Goto implementation")
        map("gy", require("telescope.builtin").lsp_type_definitions, "Goto type definition")
        map("gD", vim.lsp.buf.declaration, "Goto declaration")
        map("<leader>cs", require("telescope.builtin").lsp_document_symbols, "Document symbols")
        map("<leader>cS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")
        map("<leader>cr", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action", { "n", "x" })
        map("K", vim.lsp.buf.hover, "Hover")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "Toggle inlay hints")
        end
      end,
    })

    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      virtual_text = { source = "if_many", spacing = 2 },
    })



    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = { callSnippet = "Replace" },
          },
        },
      },
      ts_ls = {},
      jsonls = {},
    }

    local ensure_installed = vim.tbl_keys(servers)

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })
  end,
}
