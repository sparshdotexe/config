-- Variables
local terminal = "ghostty"
local fileManager = "yazi"
local browser = "chromium"
local editor = "nvim"
local menu = "rofi -show drun"

-- Scripts
hl.bind("SUPER + ALT + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-battery-limit"))
hl.bind("SUPER + ALT + N", hl.dsp.exec_cmd("pkill hyprsunset || ~/.config/hypr/scripts/night-mode"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("pkill waybar || waybar"))

-- Notifications
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd("~/.config/hypr/scripts/battery-state"))
hl.bind("SUPER + CTRL + T", hl.dsp.exec_cmd([[notify-send "$(date +'%H:%M')" "$(date +'%A, %d %B')"]]))

-- Main binds
hl.bind("SUPER + SHIFT + escape", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + space", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + R", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + S", hl.dsp.layout("togglesplit"))

-- Applications
hl.bind("CTRL + SHIFT + escape", hl.dsp.exec_cmd(terminal .. " -e btop"))
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(terminal .. " -e " .. editor))
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("clapper"))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("localsend"))
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd(terminal .. " -e " .. fileManager))
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd(terminal .. " -e wlctl"))

-- Web apps
hl.bind("SUPER + SHIFT + apostrophe", hl.dsp.exec_cmd(browser .. [[ --app="https://chatgpt.com"]]))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(browser .. [[ --app="https://chatgpt.com/?temporary-chat=true"]]))
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd(browser .. [[ --app="https://claude.ai/new?incognito="]]))
hl.bind("SUPER + SHIFT + Y", hl.dsp.exec_cmd(browser .. [[ --app="https://www.youtube.com/"]]))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(browser .. [[ --app="https://open.spotify.com/"]]))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd(browser .. [[ --app="https://web.whatsapp.com/"]]))

-- Focus movement
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- Swapping
hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
  local key = i % 10

  hl.bind(
    "SUPER + " .. key,
    hl.dsp.focus({ workspace = i })
  )

  hl.bind(
    "SUPER + SHIFT + " .. key,
    hl.dsp.window.move({ workspace = i })
  )
end

-- Workspace scrolling
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Mouse move/resize
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Window resizing
hl.bind("ALT + code:20", hl.dsp.window.resize({ x = -20, y = 0, relative = true }))
hl.bind("ALT + code:21", hl.dsp.window.resize({ x = 20, y = 0, relative = true }))
hl.bind("SUPER + ALT + code:20", hl.dsp.window.resize({ x = 0, y = -20, relative = true }))
hl.bind("SUPER + ALT + code:21", hl.dsp.window.resize({ x = 0, y = 20, relative = true }))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m output -c -o ~/pictures/screenshots"))
hl.bind("ALT + Print", hl.dsp.exec_cmd("hyprshot -m window -c -o ~/pictures/screenshots"))
hl.bind("ALT + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m region -c -o ~/pictures/screenshots"))

-- Notifications
hl.bind("SUPER + comma", hl.dsp.exec_cmd("swaync-client -C"))

-- Media
hl.bind("ALT + R", hl.dsp.exec_cmd("playerctl play-pause"))

-- Color picker
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprpicker -a"))

-- Suspend
hl.bind("SUPER + SHIFT + backslash", hl.dsp.exec_cmd("systemctl suspend"))

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("light -A 5"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("light -U 5"), { locked = true, repeating = true })

-- sudo dd if=path/to/file.iso of=/dev/sda bs=4M status=progress oflag=sync
