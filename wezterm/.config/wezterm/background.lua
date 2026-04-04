-- 背景画像のパスを設定
local wezterm_dir = os.getenv("HOME") .. "/.config/wezterm/"
local background_night = wezterm_dir .. "background_night.png"
local background_cat = wezterm_dir .. "background.png"

return {
  -- 背景夜景レイヤー（全面）
  {
    source = { File = background_night },
    width = "Cover",
    height = "Cover",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    opacity = 0.5,                               -- 透明度（0.0〜1.0、低いほど透明）
    hsb = { brightness = 0.6, saturation = 0.9 },  -- 暗めに抑えて文字の可読性を確保
  },
  -- 背景猫画像レイヤー（右下）
  {
    source = { File = background_cat },
    width = "310px",
    height = "238px",
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    vertical_align = "Bottom",
    horizontal_align = "Right",
    opacity = 0.8,                                -- 透明度（0.0〜1.0、低いほど透明）
    hsb = { brightness = 0.65, saturation = 0.85 }, -- 夜景に馴染むよう暗め・彩度控えめに
  },
}
