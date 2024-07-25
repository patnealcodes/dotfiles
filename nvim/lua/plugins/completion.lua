return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.shortmess:append "c"

      local lspkind = require "lspkind"
      lspkind.init {}

      local cmp = require "cmp"

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

      cmp.setup {
        sources = {
          { name = "path" },
          { name = "luasnip" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "buffer" },
          { name = "treesitter" },
          { name = "crates" },
          { name = "tmux" },
        },

        mapping = {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-y>"] = cmp.mapping.confirm(
            cmp.mapping.confirm {
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            },
            { "i", "c" }
          ),
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        formatting = {
          fields = { "kind", "abbr", "menu" },

          format = function(entry, vim_item)
            -- local source_names = {
            --   nvim_lsp = "(LSP)",
            --   emoji = "(Emoji)",
            --   path = "(Path)",
            --   calc = "(Calc)",
            --   vsnip = "(Snip)",
            --   luasnip = "(Snip)",
            --   buffer = "(Buffer)",
            --   tmux = "(TMUX)",
            --   copilot = "(Copilot)",
            --   treesitter = "(TreeSitter)",
            -- }

            vim_item.kind = kind[vim_item.kind]
            -- vim_item.menu = source_names[entry.source.name] or entry.source.name
            vim_item.dup = duplicates[entry.source.name] or 0

            return vim_item
          end,
        },

        window = {
          completion = cmp.config.window.bordered {},
          documentation = cmp.config.window.bordered(),
        },
      }

      local ls = require "luasnip"
      ls.config.set_config {
        history = false,
        updateevents = "TextChanged,TextChangedI",
      }

      for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
        loadfile(ft_path)()
      end

      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { desc = "Expand or jump snippet", silent = true })
      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then
          ls.jump(-1)
        end
      end, { desc = "Expand or jump snippet", silent = true })
    end,
  },
}
