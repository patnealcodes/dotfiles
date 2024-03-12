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

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function()
	local keymap = vim.keymap

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	keymap.set("n", "K", vim.lsp.buf.hover)
	keymap.set("n", "gd", vim.lsp.buf.definition)
	keymap.set("n", "gD", vim.lsp.buf.declaration)
	keymap.set("n", "<leader>d", vim.diagnostic.open_float)
	keymap.set({ "n", "v" }, "<leader>ca", function()
		vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
	end)
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
	keymap.set("n", "[d", vim.diagnostic.goto_prev)
	keymap.set("n", "]d", vim.diagnostic.goto_next)
	keymap.set("n", "<leader>rs", ":LspRestart<CR>")
end

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

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			for _, lsp in ipairs(servers) do
				local setup = {
					on_attach = on_attach,
					capabilities = capabilities,
				}
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

				lspconfig[lsp].setup(setup)
			end
		end,
	},

	-- Rust
	{
		"rust-lang/rust.vim",
		ft = "rust",
		config = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = "neovim/nvim-lspconfig",
		opts = function()
			local options = {
				server = {
					on_attach = on_attach,
					capabilities = capabilities,
				},
			}
			return options
		end,
		config = function(_, opts)
			require("rust-tools").setup(opts)
		end,
	},
}
