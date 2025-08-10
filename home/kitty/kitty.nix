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
        settings = {
            cursor_trail = 1;
            font_size = 15;
            repaint_delay = 6;
            input_delay = 1;
            sync_to_monitor = "no";
            disable_ligatures = "never";
            adjust_line_height = 1;
            strip_trailing_spaces = "always";
            window_border_width = "1px";
            hide_window_decorations = "yes";
            enable_audio_bell = "yes";
            window_alert_on_bell = "yes";
            bell_on_tab = "no";
            shell_integration = "enabled no-cursor";
            update_check_interval = 0;
            active_tab_font_style = "bold";
            inactive_tab_font_style = "normal";
            shell = "${pkgs.fish}/bin/fish";
            term = "kitty";
            hide_mouse_when_typing = true;
            background_opacity = 0.88;
            window_padding_width = "8 12";


            # Colors Scheme
            background = "#000000";
            foreground = "#ffffff";
            cursor = "#d8d8d8";
            cursor_text_color = "#181818";
            color0 = "#181818";
            color1 = "#ab4642";
            color2 = "#a1b56c";
            color3 = "#f7ca88";
            color4 = "#7cafc2";
            color5 = "#ba8baf";
            color6 = "#86c1b9";
            color7 = "#d8d8d8";
            color8 = "#585858";
            color9 = "#ab4642";
            color10 = "#a1b56c";
            color11 = "#f7ca88";
            color12 = "#7cafc2";
            color13 = "#ba8baf";
            color14 = "#86c1b9";
            color15 = "#f8f8f8";
            selection_background = "#b5d5ff";
            selection_foreground = "#000000";
        };

        extraConfig = ''
            font_family family="Ubuntu Sans Mono" wght=300
            map ctrl+shift+c copy_to_clipboard
            map ctrl+shift+v paste_from_clipboard
            map ctrl+shift+f start_search forward
            map ctrl+shift+b start_search backward
            map ctrl+= change_font_size all +1.0
            map ctrl+- change_font_size all -1.0
        '';
    };
}
