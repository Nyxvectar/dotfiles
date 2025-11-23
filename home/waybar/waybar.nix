#  	By Ethan Ryan Woo       #
#   <nyxvectar@proton.me>   #

{
    pkgs,
    config,
    ...
}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
    };
    xdg.configFile."waybar".source = ./waybar;
}
