local wezterm = require('wezterm')

local native_fullscreen = false

local config = wezterm.config_builder()

config.max_fps = 120

config.window_padding = {
  left = '0',
  right = '0',
  top = '0',
  bottom = '0',
}

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

if native_fullscreen then
  config.native_macos_fullscreen_mode = true
end

wezterm.on('window-resized', function(window, _)
  local window_dims = window:get_dimensions()
  local overrides = window:get_config_overrides() or {}
  -- Hide tab bar when there is a single tab only in native fullscreen because
  -- doing so in non-native (wezterm's) fullscreen causes wezterm to get cut by the notch.
  overrides.hide_tab_bar_if_only_one_tab = native_fullscreen and window_dims.is_full_screen
  window:set_config_overrides(overrides)
end)

config.audible_bell = 'Disabled'

local font = ({
  { family = 'FiraMono', size = 12, weight = 'Regular' },
  { family = 'JetbrainsMono', size = 12, weight = 'DemiBold' },
  { family = 'Mononoki', size = 12.5, weight = 'DemiBold' },
  { family = 'SauceCodePro', size = 12, weight = 'DemiBold' },
  { family = 'UbuntuMono', size = 14, weight = 'Regular' },
})[4]

config.font_size = font.size
config.font = wezterm.font({
  family = font.family .. ' Nerd Font Mono',
  weight = font.weight,
})
-- Disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.color_scheme = 'Tokyo Night'
config.colors = {
  background = 'black',
}

config.keys = {
  -- Use HOME as current working directory for new tab
  {
    key = 't',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab({
      cwd = wezterm.home_dir,
    }),
  },
  -- Do not prompt for confirmation when closing current tab
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab({ confirm = false }),
  },
}
-- CTRL + number to activate that tab
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL',
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
