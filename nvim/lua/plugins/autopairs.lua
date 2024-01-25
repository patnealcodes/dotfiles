return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	config = function()
		local autopairs = require("nvim-autopairs")

		autopairs.setup({
      map_bs = false,
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
			},
		})
	end,
}

