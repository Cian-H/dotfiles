-- Hyprland Configuration (Lua)
-- See https://wiki.hypr.land/Configuring/Start/

-------------------
---- AUTOSTART ----
-------------------

-- Autostart systemd targets and Noctalia desktop shell
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
    hl.exec_cmd("systemctl --user start graphical-session.target")
    hl.exec_cmd("noctalia")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("SDL_VIDEODRIVER",     "wayland")
hl.env("CLUTTER_BACKEND",     "wayland")
hl.env("HYPRCURSOR_THEME",    "phinger-cursor")
hl.env("HYPRCURSOR_SIZE",     "28")

-----------------
---- MODULES ----
-----------------

require("monitors")
require("appearance")
require("inputs")
require("binds")
