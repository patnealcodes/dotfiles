return {
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
				dashboard.button("ff", " " .. " Find file", ":Telescope find_files <CR>"),
				dashboard.button("fb", " " .. " Browse files", ":Telescope file_browser <CR>"),
				dashboard.button("of", " " .. " Recent (old) files", ":Telescope oldfiles <CR>"),
				dashboard.button("lg", " " .. " Find text", ":Telescope live_grep <CR>"),
				-- dashboard.button("s", " " .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
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
	},
}

