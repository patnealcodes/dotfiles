return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",

        dependencies = {
            "rafamadriz/friendly-snippets",
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
        },

        config = function()
            local cmp = require 'cmp'
            local ls = require("luasnip")
            ls.config.setup {}
            cmp.setup {
                window = {
                    completion = {
                        border = 'rounded',
                        scrollbar = '║',
                    },
                    documentation = {
                        border = 'rounded',
                        scrollbar = '║',
                    },
                },
                snippet = {
                    expand = function(args)
                        ls.lsp_expand(args.body)
                    end,
                },
                completion = { completeopt = 'menu,menuone,noinsert' },

                mapping = cmp.mapping.preset.insert {
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-y>'] = cmp.mapping.confirm { select = true },
                    ['<C-l>'] = cmp.mapping(function()
                        if ls.expand_or_locally_jumpable() then
                            ls.expand_or_jump()
                        end
                    end, { 'i', 's' }),
                    ['<C-h>'] = cmp.mapping(function()
                        if ls.locally_jumpable(-1) then
                            ls.jump(-1)
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'path' },
                },
            }
        end,
    }
}
