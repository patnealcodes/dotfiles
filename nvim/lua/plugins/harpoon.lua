return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VeryLazy',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        local keymap = vim.keymap

        keymap.set('n', '<leader>a', function()
            require('harpoon'):list():add()
        end, {})
        keymap.set('n', '<M-S-h>', function()
            require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
        end, {})
        keymap.set('n', '<M-S-j>', function()
            require('harpoon'):list():select(1)
        end, {})
        keymap.set('n', '<M-S-k>', function()
            require('harpoon'):list():select(2)
        end, {})
        keymap.set('n', '<M-S-l>2', function()
            require('harpoon'):list():select(3)
        end, {})
        keymap.set('n', '<M-S-;>4', function()
            require('harpoon'):list():select(4)
        end, {})
    end,
}
