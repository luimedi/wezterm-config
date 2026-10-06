local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local fps = 60

config.font = wezterm.font 'JetBrainsMono Nerd Font Mono'
config.default_domain = 'WSL:Ubuntu-26.04'
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.hide_tab_bar_if_only_one_tab = false
config.color_scheme = 'Abernathy'

config.front_end = "WebGpu"
config.max_fps = fps
config.animation_fps = fps

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.keys = {
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },
  {
    key = 't',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = '~',
    },
  },
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },

  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.ActivateTabRelative(1),
  },

  {
    key = 'LeftArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.MoveTabRelative(-1),
  },
  {
    key = 'RightArrow',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.MoveTabRelative(1),
  },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'ALT',
    action = wezterm.action.StartWindowDrag,
  },
}

return config