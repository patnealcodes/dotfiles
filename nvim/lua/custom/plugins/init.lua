return {
  {
    {
      'goolord/alpha-nvim',
      event = 'VimEnter',
      opts = function()
        local dashboard = require 'alpha.themes.dashboard'
        local logo = {
          [[    ███╗   ███╗ █████╗ ██╗  ██╗███████╗   ]],
          [[    ████╗ ████║██╔══██╗██║ ██╔╝██╔════╝   ]],
          [[    ██╔████╔██║███████║█████╔╝ █████╗     ]],
          [[    ██║╚██╔╝██║██╔══██║██╔═██╗ ██╔══╝     ]],
          [[    ██║ ╚═╝ ██║██║  ██║██║  ██╗███████╗   ]],
          [[    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝   ]],
          [[      ██████╗ ██████╗  ██████╗ ██╗        ]],
          [[     ██╔════╝██╔═══██╗██╔═══██╗██║        ]],
          [[     ██║     ██║   ██║██║   ██║██║        ]],
          [[     ██║     ██║   ██║██║   ██║██║        ]],
          [[     ╚██████╗╚██████╔╝╚██████╔╝███████╗   ]],
          [[      ╚═════╝ ╚═════╝  ╚═════╝ ╚══════╝   ]],
          [[███████╗████████╗██╗   ██╗███████╗███████╗]],
          [[██╔════╝╚══██╔══╝██║   ██║██╔════╝██╔════╝]],
          [[███████╗   ██║   ██║   ██║█████╗  █████╗  ]],
          [[╚════██║   ██║   ██║   ██║██╔══╝  ██╔══╝  ]],
          [[███████║   ██║   ╚██████╔╝██║     ██║     ]],
          [[╚══════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝     ]],
        }
        dashboard.section.header.val = logo
        dashboard.section.buttons.val = {
          dashboard.button('s', ' ' .. ' Restore Session', [[:lua require("persistence").load() <cr>]]),
        }
        dashboard.section.header.opts.hl = 'AlphaHeader'
        dashboard.opts.layout[1].val = 6
        return dashboard
      end,
      config = function(_, dashboard)
        require('alpha').setup(dashboard.opts)
        vim.api.nvim_create_autocmd('User', {
          callback = function()
            local stats = require('lazy').stats()
            local ms = math.floor(stats.startuptime * 100) / 100
            dashboard.section.footer.val = '󱐌 Lazy-loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
            pcall(vim.cmd.AlphaRedraw)
          end,
        })
      end,
    },
  },

  {
    'folke/tokyonight.nvim',
    config = function()
      require('tokyonight').setup {
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
          sidebars = 'dark',
          floats = 'dark',
        },
      }
    end,
  },

  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine'
      require('rose-pine').setup {
        disable_background = true,
      }
      vim.cmd.colorscheme 'rose-pine'
      vim.api.nvim_set_hl(0, 'Normal', { bg = '' })
      vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '' })
    end,
  },

  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
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
  },
  {
    'github/copilot.vim',
  },

  {
    'mbbill/undotree',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.keymap.set('n', 'U', vim.cmd.UndotreeToggle)
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local trouble = require 'trouble'
      trouble.setup {
        icons = false,
        height = 20,
        mode = 'document_diagnostics',
      }
      vim.keymap.set('n', '<leader>tt', function()
        trouble.toggle()
      end)
      vim.keymap.set('n', '<leader>tn', function()
        trouble.next { skip_groups = true, jump = true }
      end)
      vim.keymap.set('n', '<leader>tp', function()
        trouble.previous { skip_groups = true, jump = true }
      end)
      vim.keymap.set('n', '<leader>tw', function()
        trouble.toggle 'workspace_diagnostics'
      end)
      vim.keymap.set('n', '<leader>td', function()
        trouble.toggle 'document_diagnostics'
      end)
      vim.keymap.set('n', '<leader>tq', function()
        trouble.toggle 'quickfix'
      end)
      vim.keymap.set('n', '<leader>tl', function()
        trouble.toggle 'loclist'
      end)
    end,
  },
  {
    'rhysd/git-messenger.vim',
    event = 'VeryLazy',
    config = function()
      vim.keymap.set('n', 'GM', vim.cmd.GitMessenger)
    end,
  },
  {
    'tpope/vim-fugitive',
    event = { 'BufReadPre', 'BufNewFile' },
  },
}
