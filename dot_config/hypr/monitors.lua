-- Monitors configuration
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = 1.2,
})

hl.monitor({
    output    = "DP-6",
    mode      = "1920x1080@60",
    position  = "auto",
    scale     = "auto",
    transform = 3,
})

hl.monitor({
    output   = "DP-4",
    mode     = "2560x1440@144",
    position = "auto-left",
    scale    = "auto",
})
