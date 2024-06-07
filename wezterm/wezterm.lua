local wezterm = require("wezterm")
local mux = wezterm.mux
local config = {}

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.enable_tab_bar = false

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_rules = {
	{ intensity = "Bold", font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Bold", italic = false }) },
	{ intensity = "Normal", font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular", italic = false }) },
	{ intensity = "Half", font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Medium", italic = false }) },
}
config.font_size = 14.0
-- config.window_padding = {
-- 	left = 30,
-- 	right = 30,
-- 	top = 30,
-- 	bottom = 10,
-- }
-- config.colors = {
-- 	background = "#111111",
-- }
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.96
-- config.send_composed_key_when_left_alt_is_pressed = true
-- config.send_composed_key_when_right_alt_is_pressed = true

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

local function is_vim(pane)
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.keys = {
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
}

return config
