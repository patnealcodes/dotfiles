local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "Tokyo Night (Gogh)"
config.tab_bar_at_bottom = true

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_rules = {
	{ intensity = "Bold",   font = wezterm.font("FiraMono Nerd Font Mono", { weight = "Bold", italic = false }) },
	{ intensity = "Normal", font = wezterm.font("FiraMono Nerd Font Mono", { weight = "Regular", italic = false }) },
	{ intensity = "Half",   font = wezterm.font("FiraMono Nerd Font Mono", { weight = "Medium", italic = false }) },
}
config.font_size = 16.0
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 0,
}
config.window_decorations = "RESIZE"

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
