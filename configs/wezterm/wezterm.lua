local wezterm = require 'wezterm'
local config = {}


config.color_scheme = 'catppuccin-mocha'
config.font = wezterm.font('Dank Mono')
config.font_size = 18
config.enable_tab_bar = false
config.enable_wayland = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false


return config
