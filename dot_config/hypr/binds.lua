-- Keybindings and Mouse Interactions
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local mainMod = "SUPER"

local apps = {
    menu              = "walker",
    terminal          = "ghostty +new-window",
    browser           = "vivaldi",
    noteManager       = "obsidian",
    noteManagerSearch = "walker-obsidian-search",
    literatureManager = "zotero",
    localDocs         = "zeal",
    musicPlayer       = "sone",
    controlCenter     = "noctalia msg panel-toggle control-center",
    bluetoothManager  = "noctalia msg panel-toggle control-center bluetooth",
    officeSuite       = "onlyoffice-desktopeditors",
    fileManager       = "thunar",
    perfMonitor       = "missioncenter",
    terminalBackup    = "kitty",
    screenshot        = "hyprshot --mode region -o ~/Pictures/Screenshots/",
    lockscreen        = "noctalia msg session lock",
    powerMenu         = "noctalia msg panel-toggle session",
    colorpicker       = "hyprpicker -a",
    emojipicker       = "walker -m symbols",
    cheatsheet        = "noctalia msg panel-toggle kenn/keybind-cheatsheet:cheatsheet",
}

---------------------------------
---- 1. APPLICATION LAUNCHERS ----
---------------------------------

hl.bind(mainMod .. " + SPACE",     hl.dsp.exec_cmd(apps.menu))
hl.bind(mainMod .. " + Q",         hl.dsp.exec_cmd(apps.terminal))
hl.bind(mainMod .. " + W",         hl.dsp.exec_cmd(apps.browser))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(apps.noteManager))
hl.bind(mainMod .. " + R",         hl.dsp.exec_cmd(apps.literatureManager))
hl.bind(mainMod .. " + T",         hl.dsp.exec_cmd(apps.localDocs))
hl.bind(mainMod .. " + Y",         hl.dsp.exec_cmd(apps.musicPlayer))
hl.bind(mainMod .. " + U",         hl.dsp.exec_cmd(apps.controlCenter))
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.exec_cmd(apps.bluetoothManager))
hl.bind(mainMod .. " + I",         hl.dsp.exec_cmd(apps.officeSuite))
hl.bind(mainMod .. " + O",         hl.dsp.exec_cmd(apps.fileManager))
hl.bind(mainMod .. " + P",         hl.dsp.exec_cmd(apps.perfMonitor))
hl.bind(mainMod .. " + S",         hl.dsp.exec_cmd(apps.terminalBackup))
hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd(apps.noteManagerSearch))

-- Launch default layout across designated workspaces via hyprctl
local defaultLayoutCmd = string.format(
    'hyprctl dispatch exec "[workspace 1 silent] %s" && ' ..
    'hyprctl dispatch exec "[workspace 2 silent] %s" && ' ..
    'hyprctl dispatch exec "[workspace 3 silent] %s" && ' ..
    'hyprctl dispatch exec "[workspace 3 silent] %s"',
    apps.browser, apps.terminal, apps.noteManager, apps.localDocs
)
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(defaultLayoutCmd))

----------------------------
---- 2. FUNCTION HOTKEYS ----
----------------------------

hl.bind(mainMod .. " + TAB",       hl.dsp.exec_cmd(apps.screenshot))
hl.bind(mainMod .. " + ESCAPE",    hl.dsp.exec_cmd(apps.lockscreen))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(apps.colorpicker))
hl.bind(mainMod .. " + period",    hl.dsp.exec_cmd(apps.emojipicker))
hl.bind(mainMod .. " + C",         hl.dsp.window.close())
hl.bind(mainMod .. " + V",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + M",         hl.dsp.exec_cmd(apps.powerMenu))
hl.bind(mainMod .. " + ALT + P",   hl.dsp.window.pseudo())
hl.bind(mainMod .. " + semicolon", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + A",         hl.dsp.exec_cmd(apps.cheatsheet))

-- Media / Audio Keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("noctalia msg volume-up"),   { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("noctalia msg volume-down"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("noctalia msg volume-mute"))

-----------------------
---- 3. NAVIGATION ----
-----------------------

-- Move focus with arrows and Vim keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + H",     hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",     hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K",     hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L",     hl.dsp.focus({ direction = "right" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces 1-10
-- Move window to workspace 1-10
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + Z",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:magic" }))

------------------------------
---- 4. WINDOW MANAGEMENT ----
------------------------------

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ workspace = "+1" }))
hl.bind(mainMod .. " + SHIFT + H",     hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L",     hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.window.move({ workspace = "-1" }))
hl.bind(mainMod .. " + SHIFT + J",     hl.dsp.window.move({ workspace = "+1" }))

-- Mouse drag and resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
