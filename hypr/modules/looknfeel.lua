hl.monitor({
  output = "eDP-1",
  mode = "1920x1080@60",
  position = "auto",
  scale = "1.33",
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 3,
    border_size = 0,

    col = {
      active_border = "rgba(000000ee)",
      inactive_border = "rgba(1e1e1eee)",
    },

    resize_on_border = false,
    allow_tearing = false,
    layout = "master",
  },

  decoration = {
    rounding = 0,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = false,
      range = 4,
      render_power = 3,
      color = 0xee1a1a1a,
    },

    blur = {
      enabled = true,
      size = 20,
      passes = 3,
      special = true,
      brightness = 0.60,
      contrast = 0.75,
    },
  },

  xwayland = {
    force_zero_scaling = true,
  },

  cursor = {
    hide_on_key_press = true,
    warp_on_change_workspace = 1,
  },

  dwindle = {
    preserve_split = true,
    force_split = 2,
  },

  master = {
    new_status = "slave",
    new_on_top = false,
    orientation = "left",
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
  },
})
