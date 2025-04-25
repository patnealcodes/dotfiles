return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp"
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "lua_ls",
          "ts_ls",
        },
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          local capabilities = require('blink.cmp').get_lsp_capabilities()

          require("lspconfig")[server_name].setup({
            capabilities = capabilities
          })
        end,
      })
    end,
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "L3MON4D3/LuaSnip",
  --     "saadparwaiz1/cmp_luasnip",
  --     "hrsh7th/cmp-path",
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --     local cmp_select = { behavior = cmp.SelectBehavior.Insert }
  --     cmp.setup({
  --       sources = {
  --         { name = "nvim_lsp" },
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  --         ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  --         ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<CR>"] = cmp.mapping.confirm({ select = true }),
  --       }),
  --     })
  --   end,
  -- },
}
