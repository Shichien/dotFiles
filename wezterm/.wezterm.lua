-- Location: C:\\Users\\Username\\.wezterm.lua

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Color Config
config.color_scheme = 'DimmedMonokai'

-- Window Config
config.window_decorations = 'RESIZE'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

-- config.use_fancy_tab_bar = false
config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.7,
}

-- Set Environment
config.set_environment_variables = {
    COMSPEC = 'C:\\Users\\26421\\AppData\\Local\\Programs\\nu\\bin\\nu.exe'
}

-- Font Config
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Keyboard Binding
local act = wezterm.action

config.leader = {
    key = 'a', mods = 'CTRL', timeout_milliseconds = 2000
}
config.keys = {
    { key = 'q', mods = 'LEADER', action = act.QuitApplication },
    { key = 'H', mods = 'LEADER', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }},
    { key = 'V', mods = 'LEADER', action = act.SplitVertical { domain = 'CurrentPaneDomain' }},

    { key = 'LeftArrow',  mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left'},
    { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right'},
    { key = 'UpArrow',    mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up'},
    { key = 'DownArrow',  mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },

    { key = 'w', mods = 'CTRL', action = act.CloseCurrentTab { confirm = false }},
    { key = 'n', mods = 'CTRL', action = act.SpawnTab 'DefaultDomain'},
}

-- Mouse Binding
config.mouse_bindings = {
    -- Open Hyperlink
    {
        event = { Up = { streak = 1, button = 'Left' }},
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },

    -- Copy Selection
    {
        event = { Up = { streak = 1, button = 'Left' }},
        mods = 'CTRL',
        action = act.OpenLinkAtMouseCursor,
    },
}

return config
