#  	By Ethan Ryan Woo       #
#   <nyxvectar@proton.me>   #

{
    config,
    pkgs,
    lib,
    ...
}:

{
    programs.rofi = {
        enable = true;
        package = pkgs.rofi;
    };
    xdg.configFile."rofi".source = ./rofi;
#    xdesktop.rofi = {
#        file = pkgs.writeDesktopEntry {
#            name = "rofi";
#            exec = "rofi -show drun";
#            icon = pkgs.rofi;
#            type = "Application";
#            comment = "A window switcher, run dialog and dmenu replacement";
#            categories = "GTK;Utility;";
#        };
#    };
}
