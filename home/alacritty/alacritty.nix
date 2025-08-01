#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    ...
}:

{
    programs.alacritty = {
        enable = true;
        settings = {
            cursor = {
                style = {
                    blinking = "On";
                    shape = "Beam";
                };
            };
            env = {
                TERM = "xterm-256color";
            };
            font = {
                size = 15;
                bold = {
                    style = "LXGW WenKai Mono";
                };
                normal = {
                    family = "LXGW WenKai Mono";
                };
            };
            keyboard = {
                bindings = [
                    {
                        action = "Paste";
                        key = "V";
                        mode = "~Vi";
                        mods = "Control|Shift";
                    }
                    {
                        action = "Copy";
                        key = "C";
                        mode = "~Vi";
                        mods = "Control|Shift";
                    }
                    {
                        action = "SearchForward";
                        key = "F";
                        mode = "~Search";
                        mods = "Control|Shift";
                    }
                    {
                        action = "SearchBackward";
                        key = "B";
                        mode = "~Search";
                        mods = "Control|Shift";
                    }
                    {
                        action = "IncreaseFontSize";
                        key = "Plus";
                        mods = "Control";
                    }
                    {
                        action = "DecreaseFontSize";
                        key = "Minus";
                        mods = "Control";
                    }
                ];
            };

            terminal = {
                shell = {
                    program = "${pkgs.fish}/bin/fish";
                };
            };

            window = {
                opacity = 0.88;
                padding = {
                    x = 24;
                    y = 16;
                };
            };

            colors = {
                bright = {
                    black = "0x585858";
                    blue = "0x7cafc2";
                    cyan = "0x86c1b9";
                    green = "0xa1b56c";
                    magenta = "0xba8baf";
                    red = "0xab4642";
                    white = "0xf8f8f8";
                    yellow = "0xf7ca88";
                };
                cursor = {
                    cursor = "0xd8d8d8";
                    text = "0x181818";
                };
                normal = {
                    black = "0x181818";
                    blue = "0x7cafc2";
                    cyan = "0x86c1b9";
                    green = "0xa1b56c";
                    magenta = "0xba8baf";
                    red = "0xab4642";
                    white = "0xd8d8d8";
                    yellow = "0xf7ca88";
                };
                primary = {
                    background = "0x000000";
                    foreground = "0xffffff";
                };
            };
        };
    };
}