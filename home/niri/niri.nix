#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
  config,
  pkgs,
  user,
  lib,
  ...
}:

{
    xdg.configFile."niri".source = ./niri;
}
