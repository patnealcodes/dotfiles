return {
	"mbbill/undotree",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
