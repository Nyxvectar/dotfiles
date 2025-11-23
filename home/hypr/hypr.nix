#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{ config, pkgs, ... }:

{
#    programs.hyprland = {
#        enable = true;
#        withUWSM = true;
#        xwayland.enable = true;
#    };
    xdg.configFile."hypr".source = ./hypr;
}
