local servers = {
  "lua_ls",
  "tsserver",
  "cssls",          -- css-lsp
  "gopls",
  "html",           -- html-lsp
  "jsonls",         -- json-lsp
  "lua_ls",         -- lua-language-server
  "markdown_oxide", -- markdown-oxide
  "pyright",
  "ruff_lsp",
  "rust_analyzer",
  "tsserver", -- typescript-language-server
  "yamlls",   -- yaml-language-server
}
local formatters = {
  "black",
  "isort",
  "prettier",
  "prettierd",
  "stylua",
  "gofumpt",
  "goimports_reviser",
  "pyright",
  "rustfmt",
  "rustywind",
}
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "j-hui/fidget.nvim",
  },
  servers = servers,
  formatters = formatters,

  config = function()
    local cmp = require "cmp"
    local cmp_lsp = require "cmp_nvim_lsp"
    local capabilities =
        vim.tbl_deep_extend(
          "force",
          {},
          vim.lsp.protocol.make_client_capabilities(),
          cmp_lsp.default_capabilities())
    local ensure_installed = vim.tbl_extend("keep", servers, formatters)
    local lspconfig = require "lspconfig"

    capabilities.workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    }

    require("fidget").setup {}
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = ensure_installed,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
          }
        end,
        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = {
                  command = "clippy",
                },
              },
            },
          }
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          }
        end,
      },
    }

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup {
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm { select = true },
        ["<C-Space>"] = cmp.mapping.complete(),
      },
    }

    vim.diagnostic.config {
      float = {
        focusable = false,
        source = "always",
        -- header = "",
        -- prefix = "",
      },
    }
  end,
}
