return {
    {
        "folke/trouble.nvim",
        config = function()
            local trouble = require("trouble")
            trouble.setup({
                icons = false,
            })

            vim.keymap.set('n', '<leader>tt', function()
                trouble.toggle 'document_diagnostics'
            end)
            vim.keymap.set('n', '<leader>TT', function()
                trouble.toggle 'workspace_diagnostics'
            end)
            vim.keymap.set('n', ']t', function()
                trouble.next { skip_groups = true, jump = true }
            end)
            vim.keymap.set('n', '[t', function()
                trouble.previous { skip_groups = true, jump = true }
            end)
            vim.keymap.set('n', '<leader>tq', function()
                trouble.toggle 'quickfix'
            end)
            vim.keymap.set('n', '<leader>tl', function()
                trouble.toggle 'loclist'
            end)
        end
    },
}
