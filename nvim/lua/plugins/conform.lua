return {
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			return {
				timeout_ms = 500,
				lsp_fallback = vim.bo[bufnr].filetype,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			css = { { "prettierd", "prettier" } },
			javascript = { { "prettierd", "prettier" } },
			go = { "gofumpt", "goimports-reviser" },
			rust = { { "prettierd", "prettier" } },
		},
	},
}
