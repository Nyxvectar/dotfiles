#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        settings = [{
            layer = "top";
            position = "top";
            spacing = 8;
            "margin-top" = 4;
            "margin-left" = 8;
            "margin-right" = 8;
            "margin-bottom" = 0;
            height = 36;

            "modules-left" = [
                "hyprland/window"
                "network"
            ];
            "modules-center" = [
                "hyprland/workspaces"
            ];
            "modules-right" = [
                "tray"
                "pulseaudio"
                "memory"
                "cpu"
                "clock"
            ];

            "hyprland/workspaces" = {
                format = "{icon}";
                "persistent-workspaces" = {
                    "*" = 5;
                };
                "on-click" = "activate";
                "on-scroll-up" = "hyprctl dispatch workspace e+1";
                "on-scroll-down" = "hyprctl dispatch workspace e-1";
            };

            "hyprland/window" = {
                format = " {initialTitle}";
                "separate-outputs" = true;
            };

            tray = {
                "icon-size" = 21;
                spacing = 10;
            };

            clock = {
                interval = 1;
                format = "  {:%H:%M %b %d, %Y}";
            };

            cpu = {
                interval = 1;
                format = "  {usage:1}%";
                tooltip = true;
            };

            memory = {
                interval = 1;
                format = "  {used:0.1f}G";
                tooltip = true;
                "tooltip-format" = " RAM: {used:0.2f}G / {total:0.2f}G\nSwap: {swapUsed:0.2f}G / {swapTotal:0.2f}G";
            };

            network = {
                interval = 1;
                "format-wifi" = "  {essid} ({signalStrength}%)";
                "format-ethernet" = "  {ifname}: {ipaddr}/{cidr} ↓{bandwidthDownBits} ↑{bandwidthUpBits}";
                "format-linked" = "  No IP ({ifname})";
                "format-disconnected" = "  Disconnected";
                "tooltip-format" = "  {ifname} {ipaddr}/{cidr} via {gwaddr}";
            };

            pulseaudio = {
                "scroll-step" = 5;
                format = "{icon} {volume:2}%";
                "format-muted" = " MUTED";
                "format-bluetooth" = "{icon} {volume}%";
                "format-bluetooth-muted" = " MUTED";
                "format-icons" = {
                    default = [
                        " "
                        " "
                        " "
                    ];
                };
                "on-click-right" = "pavucontrol";
                "ignored-sinks" = [
                    "AudioRelay Virtual Sink"
                    "Recorder Sink"
                ];
            };
        }];

        style = ''
            * {
                text-shadow: none;
                font-family: "LXGW WenKai";
                font-weight: 500;
                font-size: 16px;
            }

            window#waybar {
                background-color: transparent;
            }

            .modules-left {
                border-radius: 100px;
                background-color: rgba(18, 18, 18, 1.0);
                padding: 0 8px;
            }

            .modules-center {
                border-radius: 100px;
                background-color: rgba(18, 18, 18, 1.0);
            }

            .modules-right {
                border-radius: 100px;
                background-color: rgba(18, 18, 18, 1.0);
                padding: 0 8px;
            }

            tooltip {
                background-color: rgba(18, 18, 18, 1.0);
                border: 2px solid rgba(34, 34, 34, 0.5);
                border-radius: 15px;
                font-size: 18px;
            }

            #clock,
            #cpu,
            #memory,
            #network,
            #pulseaudio,
            #tray,
            #mode,
            #window,
            #workspaces {
                margin-top: 0px;
                margin-bottom: 0px;
                padding: 0px 6px 0px 6px;
                background-color: transparent;
            }

            #workspaces {
                padding: 4px 12px;

                transition-property: background, color, border;
                transition-duration: 0.2s;
            }

            #workspaces button {
                border: none;
                border-radius: 0px;
                padding: 0px 0px;
                background: transparent;
                color: #ffffff;
                margin: 0 4px;
                min-width: 24px;

                transition-property: background, color, border, margin, padding;
                transition-duration: 0.2s;
            }

            #workspaces button:hover {
                color: rgba(255, 255, 255, 0.5);
            }

            #workspaces button.empty {
                color: rgba(255, 255, 255, 0.25);
            }

            #workspaces button.active {
                color: #ffffff;
                border-bottom: 3px solid #ffffff;
                margin-bottom: 1px;
            }

            #workspaces button.urgent {
                color: #eb4d4b;
                border-bottom: 3px solid #eb4d4b;
            }

            #mode {
                background-color: #64727D;
                border-bottom: 3px solid #ffffff;
            }

            #clock {
                color: #ffffff;
            }

            #cpu {
                color: #ffffff;
            }

            #memory {
                color: #ffffff;
            }

            #pulseaudio {
                color: #ffffff;
            }

            #network {
                color: #ffffff;
            }

            #tray {
                color: transparent;
            }

            #window {
                color: #ffffff;
                margin-left: 4px;
            }
        '';
    };
}
