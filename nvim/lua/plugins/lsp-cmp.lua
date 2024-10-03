return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "onsails/lspkind.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    local lspkind = require "lspkind"
    lspkind.init {}

    local duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    }

    local kind = {
      Array = "",
      Boolean = "",
      Class = "",
      Color = "",
      Constant = "",
      Constructor = "",
      Enum = "",
      EnumMember = "",
      Event = "",
      Field = "",
      File = "",
      Folder = "󰉋",
      Function = "",
      Interface = "",
      Key = "",
      Keyword = "",
      Method = "",
      Module = "",
      Namespace = "",
      Null = "󰟢",
      Number = "",
      Object = "",
      Operator = "",
      Package = "",
      Property = "",
      Reference = "",
      Snippet = "",
      String = "",
      Struct = "",
      Text = "",
      TypeParameter = "",
      Unit = "",
      Value = "",
      Variable = "",
    }

    require("fidget").setup({})

    cmp.setup {
      formatting = {
        fields = { "kind", "abbr", "menu" },

        format = function(entry, vim_item)
          local source_names = {
            path = "(Path)",
            nvim_lsp = "(LSP)",
            calc = "(Calc)",
            buffer = "(Buffer)",
            treesitter = "(TreeSitter)",
            crates = "(Crates)"
          }

          vim_item.kind = kind[vim_item.kind]
          vim_item.menu = source_names[entry.source.name] or entry.source.name
          vim_item.dup = duplicates[entry.source.name] or 0

          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "treesitter" },
        { name = "crates" },
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
      },
      window = {
        completion = cmp.config.window.bordered {},
        documentation = cmp.config.window.bordered(),
      },
    }

    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { desc = "Expand or jump snippet" })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { desc = "Expand or jump snippet" })

    -- // Language Servers // --
    -- // https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    -- npm i -g @vtsls/language-server
    lspconfig.vtsls.setup({ capabilities = capabilities })

    -- rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })

    -- $ pip install pyright
    lspconfig.pyright.setup({ capabilities = capabilities })

    -- $ npm i -g yaml-language-server
    lspconfig.yamlls.setup({ capabilities = capabilities })

    -- https://luals.github.io/#install
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "Lua 5.1" },
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
  end
}
