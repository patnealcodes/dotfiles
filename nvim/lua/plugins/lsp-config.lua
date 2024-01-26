local servers = {
	"cssls",
	"emmet_ls",
	"eslint",
	"golangci_lint_ls",
	"gopls",
	"html",
	"htmx",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"tsserver",
	"yamlls",
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function()
				local keymap = vim.keymap

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
				})

				keymap.set("n", "K", vim.lsp.buf.hover)
				keymap.set("n", "gD", vim.lsp.buf.declaration)
				keymap.set("n", "<leader>d", vim.diagnostic.open_float)
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
				keymap.set("n", "[d", vim.diagnostic.goto_prev)
				keymap.set("n", "]d", vim.diagnostic.goto_next)
				keymap.set("n", "<leader>rs", ":LspRestart<CR>")
			end

			for _, lsp in ipairs(servers) do
				local util = require("lspconfig/util")
				local setup = {
					on_attach = on_attach,
					capabilities = capabilities,
				}

				if lsp == "pyright" then
					setup.filetypes = { "python" }
				end

				if lsp == "cssls" then
					setup.settings = {
						css = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
						scss = {
							validate = true,
							lint = {
								unknownAtRules = "ignore",
							},
						},
					}
				end

				if lsp == "rust_analyzer" then
					setup.filetypes = { "rust" }
					setup.root_dir = util.root_pattern("Cargo.toml")
					setup.settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
						},
					}
				end

				lspconfig[lsp].setup(setup)
			end
		end,
	},
}
