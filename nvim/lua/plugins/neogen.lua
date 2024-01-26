return {
	"danymat/neogen",
	config = function()
		local neogen = require("neogen")
		neogen.setup({
			snippet_engine = "luasnip",
		})
		vim.keymap.set("n", "<leader>nf", function()
			neogen.generate({ type = "func" })
		end)
		vim.keymap.set({ "i", "s" }, "<C-p>", function()
			neogen.luasnip.jump(-1)
		end, { silent = true })
		vim.keymap.set({ "i", "s" }, "<C-n>", function()
			neogen.luasnip.jump(1)
		end, { silent = true })
	end,
}
