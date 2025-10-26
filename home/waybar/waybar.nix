#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
    };
    xdg.configFile."waybar".source = ./waybar;
}
