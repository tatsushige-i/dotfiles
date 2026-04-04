local wezterm = require 'wezterm'
local act = wezterm.action

return {
  -- ペイン分割
  { key = 'd', mods = 'CMD',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },  -- 左右分割
  { key = 'd', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },    -- 上下分割

  -- ペイン移動
  { key = 'h', mods = 'CMD|OPT', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CMD|OPT', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CMD|OPT', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CMD|OPT', action = act.ActivatePaneDirection 'Right' },

  -- ペインサイズ調整（Cmd+Ctrl + hjkl）
  { key = 'h', mods = 'CMD|CTRL', action = act.AdjustPaneSize { 'Left', 5 } },
  { key = 'j', mods = 'CMD|CTRL', action = act.AdjustPaneSize { 'Down', 5 } },
  { key = 'k', mods = 'CMD|CTRL', action = act.AdjustPaneSize { 'Up', 5 } },
  { key = 'l', mods = 'CMD|CTRL', action = act.AdjustPaneSize { 'Right', 5 } },

  -- ペインを閉じる
  { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = true } },

  -- ワークスペース
  { key = 's', mods = 'CMD|SHIFT', action = act.ShowLauncherArgs { flags = 'WORKSPACES' } },        -- 一覧表示
  { key = 'n', mods = 'CMD|SHIFT', action = act.SwitchToWorkspace },                                -- 新規作成

  -- コピーモード（Vim風テキスト選択）
  { key = 'x', mods = 'CMD|SHIFT', action = act.ActivateCopyMode },
}
