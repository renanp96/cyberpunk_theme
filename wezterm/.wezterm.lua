local wezterm = require("wezterm")
local config = {}

-- =====================
-- PERFORMANCE
-- =====================
config.max_fps = 120
config.front_end = "WebGpu"

-- =====================
-- FONTE
-- =====================
config.font = wezterm.font_with_fallback({
  "JetBrains Mono",
  "Noto Color Emoji"
})
config.font_size = 13.0

-- =====================
-- JANELA MAXIMIZADA
-- =====================
wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false

-- =====================
-- TRANSPARÊNCIA
-- =====================
config.window_background_opacity = 0.90

-- =====================
-- PADDING
-- =====================
config.window_padding = {
  left = 16,
  right = 16,
  top = 12,
  bottom = 12,
}

-- =====================
-- CYBERPUNK ANSI PALETTE
-- =====================
config.colors = {
  foreground = "#fcee09",   -- amarelo 2077
  background = "#0a0f14",

  cursor_bg = "#00f0ff",
  cursor_border = "#00f0ff",
  cursor_fg = "#0a0f14",

  selection_bg = "#1b2430",

  ansi = {
    "#0a0f14", -- black
    "#ff0055", -- red (erros)
    "#00ff9f", -- green (executáveis)
    "#fcee09", -- yellow (arquivos comuns)
    "#00bfff", -- blue (pastas)
    "#ff2eff", -- magenta (symlinks)
    "#00f0ff", -- cyan
    "#aaaaaa", -- white
  },

  brights = {
    "#1a1f2b",
    "#ff3c7d",
    "#00ffcc",
    "#fff75e",
    "#33d6ff",
    "#ff6bff",
    "#33ffff",
    "#ffffff",
  },

  tab_bar = {
    background = "#0a0f14",
  },
}

-- =====================
-- CURSOR
-- =====================
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

-- =====================
-- TAB BAR CYBER STYLE
-- =====================
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#0a0f14"
  local background = "#1b2430"
  local foreground = "#fcee09"

  if tab.is_active then
    background = "#00f0ff"
    foreground = "#0a0f14"
  elseif hover then
    background = "#ff2eff"
    foreground = "#0a0f14"
  end

  local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = "#00f0ff" } },
    { Text = "" },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = " " .. title .. " " },
    { Background = { Color = edge_background } },
    { Foreground = { Color = "#00f0ff" } },
    { Text = "" },
  }
end)

return config

