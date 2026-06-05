-- 背景画像のパスを設定
local wezterm_dir = os.getenv("HOME") .. "/.config/wezterm/"
local background_night = wezterm_dir .. "background_night.png"

return {
  -- 背景夜景レイヤー（全面）
  {
    source = { File = background_night },
    width = "Cover",
    height = "Cover",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    opacity = 0.5,                               -- 透明度（0.0〜1.0、低いほど透明）
    hsb = { brightness = 0.25, saturation = 0.9 },  -- 暗めに抑えて文字の可読性を確保
  },
  -- 暗いオーバーレイレイヤー（最前面）
  {
    source = { Color = "#000000" },              -- 単色の黒
    width = "100%",
    height = "100%",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    opacity = 0.7,                               -- 画像全体に黒を重ね、明るいスポットを一律に抑制
  },
}
