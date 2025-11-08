{
    config,
    pkgs,
    user,
    lib,
    ...
}:

{
    imports = [
        ./animations.nix
        ./autostart.nix
        ./override-config.nix
        ./swhkd.nix
    ];

    programs.niri = {
        enable = true;
        package = pkgs.niri;
        settings =
            with config.lib.stylix.colors.withHashtag;
            let
                shadowConfig = {
                    enable = true;
                    spread = 0;
                    softness = 10;
                    color = "#000000dd";
                };
            in
            {
                hotkey-overlay.skip-at-startup = true;
                prefer-no-csd = true;
                input = {
                    focus-follows-mouse.enable = true;
                    touchpad.natural-scroll = false;
                    keyboard.xkb.options = "caps:escape";
                };
                environment = {
                    DISPLAY = ":0";
                    XIM = "fcitx";
                    GTK_IM_MODULE = "fcitx";
                    QT_IM_MODULE = "fcitx";
                };
                outputs = builtins.mapAttrs (name: value: {
                    inherit (value) scale mode position;
                    transform.rotation = value.rotation;
                    background-color = base01;
                }) config.monitors;
                binds = with config.lib.niri.actions; {
                    "Mod+Return".action = spawn "kitty";
                    # "Mod+Shift+Return".action = spawn [
                    #   "ghostty"
                    #   "--launched-from=desktop"
                    # ];
                    "Mod+P".action = spawn [
                        "sh"
                        "-c"
                        "$(tofi-run)"
                    ];
                    "Mod+Shift+C".action = spawn "/home/${user}/scripts/tofi/colorscheme";
                };
                window-rules =
                    let
                        matchAppIDs = appIDs: map (appID: { app-id = appID; }) appIDs;
                    in
                    [
                        {
                            geometry-corner-radius = {
                                bottom-left = 10.0;
                                bottom-right = 10.0;
                                top-left = 10.0;
                                top-right = 10.0;
                            };
                            clip-to-geometry = true;
                            draw-border-with-background = false;
                        }
                        {
                            matches = [
                                { app-id = "yad"; }
                            ];
                            open-floating = true;
                        }
                        {
                            matches = matchAppIDs [
                                "firefox"
                                "org.qutebrowser.qutebrowser"
                                "kitty"
                                "evince"
                                "zathura"
                                "Zotero"
                                "RStudio"
                            ];
                            default-column-width = {
                                proportion = 0.95;
                            };
                        }
                        {
                            matches = [
                                { is-focused = true; }
                            ];
                            opacity = 0.95;
                        }
                        {
                            matches = [
                                { is-focused = false; }
                            ];
                            opacity = 0.85;
                        }
                    ];
                layer-rules = [
                    {
                        matches = [ { namespace = "swww-daemonbackdrop"; } ];
                        place-within-backdrop = true;
                    }
                    {
                        matches = [ { namespace = "launcher"; } ];
                        geometry-corner-radius = {
                            bottom-left = 15.0;
                            bottom-right = 15.0;
                            top-left = 15.0;
                            top-right = 15.0;
                        };
                        shadow = shadowConfig;
                    }
                ];
                gestures = {
                    dnd-edge-view-scroll = {
                        trigger-width = 60;
                        delay-ms = 100;
                        max-speed = 1500;
                    };
                };
                workspaces = with config.lib.monitors; {
                    "1" = {
                        open-on-output = mainMonitorName;
                        name = "coding";
                    };
                    "2" = {
                        open-on-output = mainMonitorName;
                        name = "browsing";
                    };
                    "3" = {
                        open-on-output = builtins.head otherMonitorsNames;
                        name = "reading";
                    };
                    "4" = {
                        open-on-output = mainMonitorName;
                        name = "music";
                    };
                };
                xwayland-satellite = {
                    enable = true;
                    path = lib.getExe pkgs.xwayland-satellite;
                };
                overview = {
                    zoom = 0.36;
                    backdrop-color = base02;
                };
                layout = {
                    gaps = 12;
                    border = {
                        enable = true;
                        width = 4;
                        active = {
                            gradient = {
                                from = base07;
                                to = base0E;
                                angle = 45;
                                in' = "oklab";
                                # relative-to = "workspace-view";
                            };
                        };
                        # inactive.color = "#585b70";
                        inactive.color = base02;
                    };
                    focus-ring.enable = false;
                    struts = {
                        left = 2;
                        right = 2;
                        top = 0;
                        bottom = 2;
                    };
                    insert-hint = {
                        enable = true;
                        display = {
                            gradient = {
                                from = base0A;
                                to = base09;
                                angle = 45;
                            };
                        };
                    };
                    shadow = shadowConfig;
                    tab-indicator = {
                        hide-when-single-tab = true;
                        gap = 5;
                        width = 6;
                        length.total-proportion = 0.5;
                        position = "right";
                        gaps-between-tabs = 2;
                    };
                };
            };
    };
}