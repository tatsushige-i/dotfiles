-- Pull in the wezterm API
local wezterm = require 'wezterm'
local background = require 'background' -- 背景用のファイルを読み込み
local keybinds = require 'keybinds'     -- キーバインド用のファイルを読み込み

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'AdventureTime'

-- This is where you actually apply your config choices.

config.automatically_reload_config = true  -- 設定変更を自動反映
config.font = wezterm.font("Hack Nerd Font") -- Nerd Font（アイコン対応）
config.font_size = 13.0                    -- フォントサイズ
config.use_ime = true                      -- 日本語IMEを有効化
config.scrollback_lines = 10000            -- スクロールバック行数
config.audible_bell = "Disabled"           -- ビープ音を無効化

-- 背景
config.background = background                   -- 背景画像（background.luaで定義）
config.window_background_opacity = 0.88          -- ウィンドウの透過度
config.macos_window_background_blur = 25         -- macOSの背景ぼかし強度
config.window_background_gradient = {
  colors = { "#000000" },                        -- グラデーション（黒単色）
}

-- ウィンドウ・タブバー
-- config.window_decorations = "RESIZE"             -- タイトルバーを非表示
config.hide_tab_bar_if_only_one_tab = true       -- タブが1つなら非表示
config.show_new_tab_button_in_tab_bar = false    -- +ボタンを非表示
config.window_frame = {
  inactive_titlebar_bg = "none",                 -- 非アクティブ時のタイトルバー背景
  active_titlebar_bg = "none",                   -- アクティブ時のタイトルバー背景
}

local SOLID_LEFT_ARROW  = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, cfg, hover, max_width)
  local tab_bg = "#3a4a52"       -- 非アクティブタブの色
  local foreground = "#aaaaaa"

  if tab.is_active then
    tab_bg = "#ae8b2d"           -- アクティブタブは黄金色
    foreground = "#ffffff"
  elseif hover then
    tab_bg = "#4a5a62"           -- ホバー時は少し明るく
    foreground = "#cccccc"
  end

  local edge_foreground = tab_bg
  local title = "  " .. wezterm.truncate_right(tab.active_pane.title, max_width - 6) .. "  "

  return {
    { Background = { Color = "none" } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = tab_bg } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = "none" } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

wezterm.on("update-right-status", function(window, pane)
  local workspace = window:active_workspace()
  local key_table = window:active_key_table()

  if key_table then
    -- キーテーブル有効時はモード名を赤で表示
    window:set_right_status(wezterm.format({
      { Foreground = { Color = "#ff6b6b" } },
      { Text = "  [" .. key_table:upper() .. "]  " },
    }))
  else
    -- 通常時はワークスペース名を表示
    window:set_right_status(wezterm.format({
      { Foreground = { Color = "#ae8b2d" } },
      { Text = "  " },
      { Foreground = { Color = "#aaaaaa" } },
      { Text = workspace .. "  " },
    }))
  end
end)

-- キーバインド
config.keys = keybinds

-- Finally, return the configuration to wezterm:
return config
