return {
	"rhysd/git-messenger.vim",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "GM", vim.cmd.GitMessenger)
	end,
}
