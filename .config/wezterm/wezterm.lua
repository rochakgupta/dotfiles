local wezterm = require("wezterm")

local native_fullscreen = false

local config = wezterm.config_builder()

config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"

if native_fullscreen then
	config.native_macos_fullscreen_mode = true
end

wezterm.on("window-resized", function(window, _)
	local window_dims = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}
	-- Hide tab bar when there is a single tab only in native fullscreen because
	-- doing so in non-native (wezterm's) fullscreen causes wezterm to get cut by the notch.
	overrides.hide_tab_bar_if_only_one_tab = native_fullscreen and window_dims.is_full_screen
	window:set_config_overrides(overrides)
end)

config.audible_bell = "Disabled"

config.font_size = 12.0
local fonts = { "SauceCodePro", "JetbrainsMono" }
config.font = wezterm.font({
	family = fonts[1] .. " Nerd Font Mono",
	weight = "DemiBold",
})
-- Disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

config.color_scheme = "Tokyo Night"
config.colors = {
	background = "black",
}

config.keys = {
	-- Use HOME as current working directory for new tab
	{
		key = "t",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
		}),
	},
	-- Do not prompt for confirmation when closing current tab
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

return config
