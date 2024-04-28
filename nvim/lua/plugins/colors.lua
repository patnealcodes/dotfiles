return {
	"AlexvZyl/nordic.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local C = require("nordic.colors.nordic")
		require("nordic").load({
			italic_comments = true,
			transparent_bg = true,
			bright_border = true,
			override = {
				TreesitterContext = { bg = C.black0 },
			},
			cursorline = {
				bold = false,
				bold_number = true,
				theme = "light",
			},
			telescope = {
				style = "classic",
			},
		})
	end,
}
