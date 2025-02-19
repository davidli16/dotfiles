local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Jellybeans'
config.window_decorations = 'RESIZE'
config.font = wezterm.font("SauceCodePro Nerd Font Mono")
config.keys = {
  {
    key = '-',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '\\',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

return config
