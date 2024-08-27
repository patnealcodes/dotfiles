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
config.font_size = 12.0
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

config.leader = { key = "a", mods = "CTRL" }

config.keys = {
	{ key = '\'', mods = "LEADER",       action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } } },
	{ key = '%',  mods = "LEADER|SHIFT", action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } } },
	{ key = "z",  mods = "LEADER",       action = "TogglePaneZoomState" },
	{ key = "c",  mods = "LEADER",       action = wezterm.action { SpawnTab = "CurrentPaneDomain" } },
	{ key = "h",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
	{ key = "j",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
	{ key = "k",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
	{ key = "l",  mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
	{ key = "h",  mods = "ALT",          action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
	{ key = "j",  mods = "ALT",          action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
	{ key = "k",  mods = "ALT",          action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
	{ key = "l",  mods = "ALT",          action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
	{ key = "n",  mods = "LEADER",       action = wezterm.action { ActivateTabRelative = 1 } },
	{ key = "p",  mods = "LEADER",       action = wezterm.action { ActivateTabRelative = -1 } },
	{ key = "x",  mods = "LEADER",       action = wezterm.action { CloseCurrentPane = { confirm = true } } },
}

return config
