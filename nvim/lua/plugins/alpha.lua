return {
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
                dashboard.section.footer.val = '󱐌 Lazy-loaded ' ..
                stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
