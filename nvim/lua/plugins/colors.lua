return {
	"rose-pine/neovim",
	name = "rose-pine",
	config = function()
		require("rose-pine").setup({
			styles = {
				italic = false,
			},
		})

		vim.cmd.colorscheme("rose-pine-main")

		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	end,
}
