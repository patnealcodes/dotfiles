-- return {
--   "nvim-treesitter/nvim-treesitter",
--   config = function()
--     require("nvim-treesitter.configs").setup({
--       ensure_installed = {
--         "c",
--         "css",
--         "go",
--         "html",
--         "javascript",
--         "lua",
--         "python",
--         "rust",
--         "typescript",
--         "tsx",
--         "vim",
--         "vimdoc",
--         "yaml"
--       },
--       auto_install = true,
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = { "markdown" },
--       },
--       incremental_selection = {
--         enable = true,
--         keymaps = {
--           init_selection = "<Enter>",
--           node_incremental = "<Enter>",
--         }
--       }
--     })
--   end
-- }

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				ensure_installed = {
					"lua",
					"python",
					"typescript",
					"tsx",
					"go",
					"yaml"
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 1,
		},
	},
}
