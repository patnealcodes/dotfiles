local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

config.colors = {
	background = "#1e2224",
}
config.color_scheme = "Rosé Pine Moon (Gogh)"

config.enable_tab_bar = false

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_rules = {
	{ intensity = "Bold",   font = wezterm.font("FiraMono Nerd Font Mono", { weight = "Bold", italic = false }) },
	{ intensity = "Normal", font = wezterm.font("FiraMono Nerd Font Mono", { weight = "Regular", italic = false }) },
	{ intensity = "Half",   font = wezterm.font("FiraMono Nerd Font Mono", { weight = "Medium", italic = false }) },
}
config.font_size = 15.0
config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 0,
}
config.window_decorations = "RESIZE"

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
