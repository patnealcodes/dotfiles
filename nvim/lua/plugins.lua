return {
  --> Dependencies
  { 'nvim-lua/plenary.nvim', name = 'plenary' },
  { 'nvim-tree/nvim-web-devicons', name = 'devicons' },
  
  --> Rose Pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      require('rose-pine').setup({
        styles = {
          transparency = true
        }
      })
      vim.cmd('colorscheme rose-pine')
    end
  },

  
  --> Telescope
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'plenary' },
    config = function ()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>bb', builtin.buffers)
      vim.keymap.set('n', '<leader>of', builtin.oldfiles)
      vim.keymap.set('n', '<leader>lg', builtin.live_grep)
    end
  },

  --> Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        ensure_installed = { "lua", "javascript", "vimdoc"},
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },

  --> Oil
  {
    'stevearc/oil.nvim',
    dependencies = { 'devicons' },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "-", "<CMD>Oil --float<CR>")
    end
  },

  --> Alpha
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
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
        dashboard.button("ff", " " .. " Find file", ":Telescope find_files "),
        dashboard.button("-", "" .. " Oil", ":Oil --float <CR>"),
        dashboard.button("of", " " .. " Recent (old) files", ":Telescope oldfiles <CR>"),
        dashboard.button("lg", " " .. " Grep", ":Telescope live_grep <CR>"),
        dashboard.button("la", "󰒲 " .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.opts.layout[1].val = 6
      return dashboard
    end,
    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)
      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100) / 100
          dashboard.section.footer.val = "󱐌 Lazy-loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  }
}
