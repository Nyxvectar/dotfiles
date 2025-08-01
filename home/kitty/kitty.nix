#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    lib,
    pkgs,
    ...
}:

{
    programs.kitty = {
        enable = true;
        font = {
            name = "Ubuntu Sans Mono";
            size = 18;
        };

        settings = {
            repaint_delay = 6;
            input_delay = 1;
            sync_to_monitor = "no";
            font_features = "thin";
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
            disable_ligatures = "never";
            adjust_line_height = 1;
            copy_on_select = "yes";
            strip_trailing_spaces = "always";
            cursor_shape = "block";
            cursor_blink_interval = 0;
            window_border_width = "1px";
            hide_window_decorations = "yes";
            enable_audio_bell = "yes";
            window_alert_on_bell = "yes";
            bell_on_tab = "no";
            shell_integration = "enabled no-cursor";
            update_check_interval = 0;
            background_opacity = 0.9;
            active_tab_font_style = "bold";
            inactive_tab_font_style = "normal";
            background = "#000000";
            foreground = "#ffffff";
            cursor = "#bbbbbb";
            selection_background = "#b5d5ff";
            color0 = "#000000";
            color8 = "#545454";
            color1 = "#ff5555";
            color9 = "#ff5555";
            color2 = "#55ff55";
            color10 = "#55ff55";
            color3 = "#ffff55";
            color11 = "#ffff55";
            color4 = "#5555ff";
            color12 = "#5555ff";
            color5 = "#ff55ff";
            color13 = "#ff55ff";
            color6 = "#55ffff";
            color14 = "#55ffff";
            color7 = "#bbbbbb";
            color15 = "#ffffff";
            selection_foreground = "#000000";
        };
    };
}