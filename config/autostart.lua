-- Auto-start config
-- if you dont use UWSM add your auto start programs here, otherwise use XDG autostart https://wiki.archlinux.org/title/XDG_Autostart


-- cmd: what to launch. class: regex for the window class, used to send it to `workspace`.
-- Find a class with `hyprctl clients | grep class`.
local autostart_apps = {
    -- Workspace 1
    -- { cmd = "zapzap",      class = "^(com\\.rtosta\\.zapzap|[Zz]ap[Zz]ap)$", workspace = 1 },
    -- { cmd = "spotify",     class = "^([Ss]potify)$",                         workspace = 1 },
    -- { cmd = "thunderbird", class = "^([Tt]hunderbird.*|org\\.mozilla\\.thunderbird)$", workspace = 1 },
    -- -- Workspace 2
    -- { cmd = "firefox",     class = "^(firefox)$",                            workspace = 2 },
    -- -- Workspace 3
    -- { cmd = "vscodium",    class = "^([Cc]odium|VSCodium|vscodium)$",        workspace = 3 },

    -- Workspace 1
    { cmd = "zapzap", workspace = 1 },
    { cmd = "spotify", workspace = 1 },
    { cmd = "thunderbird", workspace = 1 },
    -- Workspace 2
    { cmd = "firefox", workspace = 2 },
    -- { cmd = "obsidian", workspace = 2 },
    -- Workspace 3
    -- { cmd = "vscodium", workspace = 3 },
}

-- Launching alone does not pick a workspace, so pin each app to its workspace with a window rule.
for _, app in ipairs(autostart_apps) do
    hl.window_rule({ match = { class = app.class }, workspace = app.workspace .. " silent" })
end

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("noctalia")
    hl.exec_cmd("xhost +SI:localuser:root")

    for _, app in ipairs(autostart_apps) do
        hl.exec_cmd(LAUNCH_PREFIX .. app.cmd .. " 2>/dev/null &")
    end
end)
