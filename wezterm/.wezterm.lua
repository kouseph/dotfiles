local wezterm = require("wezterm")

return {
  default_prog = {"/bin/zsh", "-l"},  -- "-l" makes it a login shell
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  font = wezterm.font("AnonymicePro Nerd Font Mono"), -- replace with the exact name installed
  font_size = 22.0,
  enable_tab_bar = false,
  window_decorations = "RESIZE",
  window_background_opacity = 0.8
}
