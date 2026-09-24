-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart

local launchPrefix = "uwsm app -- "

local autostart_apps = {
    -- Workspace 1
    { cmd = "zapzap",   workspace = 1},
    { cmd = "spotify",   workspace = 1},
    { cmd = "thunderbird",   workspace = 1},
    -- Workspace 2
    { cmd = "firefox", workspace = 2},
    -- Workspace 3
    { cmd = "gimp", workspace = 3},
    -- Workspace 4
    -- { cmd = "input", workspace = 4},
}

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("xhost +SI:localuser:root")

    for _, app in ipairs(autostart_apps) do
        hl.exec_cmd(launchPrefix .. app.cmd .. " 2>/dev/null &")
    end

    -- hl.exec_cmd("zapzap")
    -- hl.exec_cmd("spotify")
    -- hl.exec_cmd("thunderbird")
    -- hl.exec_cmd("firefox")
end)
