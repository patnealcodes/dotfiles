-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },
  {
    'github/copilot.vim',
  },
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      local keymap = vim.keymap

      keymap.set('n', '<leader>a', function()
        require('harpoon'):list():append()
      end, {})
      keymap.set('n', '<leader>h', function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end, {})
      keymap.set('n', '<leader>1', function()
        require('harpoon'):list():select(1)
      end, {})
      keymap.set('n', '<leader>2', function()
        require('harpoon'):list():select(2)
      end, {})
      keymap.set('n', '<leader>3', function()
        require('harpoon'):list():select(3)
      end, {})
      keymap.set('n', '<leader>4', function()
        require('harpoon'):list():select(4)
      end, {})
    end,
  },
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    cmd = 'ObsidianQuickSwitch',
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      'BufReadPre vim.fn.expand ~/Documents/BisVault/**.md',
      'BufNewFile vim.fn.expand ~/Documents/BisVault/**.md',
    },
    opts = {
      workspaces = {
        {
          name = 'BisVault',
          path = '~/Documents/BisVault',
        },
      },
    },
  },
  {
    'lewis6991/gitsigns.nvim',
    'rhysd/git-messenger.vim',
    'rhysd/committia.vim',
    'sindrets/diffview.nvim',
    'Rawnly/gist.nvim',
  },
}
