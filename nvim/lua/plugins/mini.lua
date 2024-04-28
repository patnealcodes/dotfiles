return {
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [']quote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		local statusline = require("mini.statusline")

		statusline.setup({
			content = {
				active = function()
					local mode, mode_hl = statusline.section_mode({ trunc_width = 50 })
					local filename = statusline.section_filename({ trunc_width = 140 })
					local search = statusline.section_searchcount({ trunc_width = 75 })
					local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })

					return statusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- End left alignment
						"%<", -- Mark general truncate point
						{ hl = "MiniStatuslineSearch", strings = { search } },
						{ hl = "MiniStatuslineDevinfo", strings = { diagnostics } },
					})
				end,
			},
		})
	end,
}
