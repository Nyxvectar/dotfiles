#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{ config, lib, ... }:

{
    programs.rofi = {
        enable = true;
    };
    xdg.configFile."rofi".source = ./rofi;
}
