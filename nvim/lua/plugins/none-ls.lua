return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			on_attach = function(client, bufnr)
				vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { silent = true})
			end,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
			},
		})
	end,
}
