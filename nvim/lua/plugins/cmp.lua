return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      -- cmp
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",

      -- snip snap
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local duplicates = {
        buffer = 1,
        path = 1,
        nvim_lsp = 0,
      }

      cmp.setup {

        formatting = {
          fields = { "abbr", "menu" },

          format = function(entry, vim_item)
            local source_names = {
              path = "(Path)",
              nvim_lsp = "(LSP)",
              calc = "(Calc)",
              buffer = "(Buffer)",
              treesitter = "(TreeSitter)",
              crates = "(Crates)"
            }

            vim_item.menu = source_names[entry.source.name] or entry.source.name
            vim_item.dup = duplicates[entry.source.name] or 0

            return vim_item
          end,
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },

        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "treesitter" },
          { name = "crates" },
        },

        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-y>"] = cmp.mapping.confirm(),
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

      vim.opt.cot = { "menu", "menuone", "noselect" } -- insert mode completion options
      vim.opt.shm:append "c"                          -- short message - don't give ins-completion-menu messages
    end,
  },
}
