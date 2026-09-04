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

-- Match HP portrait monitor by description to preserve orientation across connector renames
hl.monitor({
    output    = "desc:HP Inc. HP E23 G4 CN41330H6Q",
    mode      = "1920x1080@60",
    position  = "auto",
    scale     = 1,
    transform = 3,
})

-- Match BenQ landscape monitor by description
hl.monitor({
    output   = "desc:BNQ BenQ GW2780 D4M0393001Q",
    mode     = "1920x1080@60",
    position = "auto",
    scale    = 1,
})

hl.monitor({
    output   = "DP-4",
    mode     = "2560x1440@144",
    position = "auto-left",
    scale    = "auto",
})
