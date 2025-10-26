#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    config,
    ...
}:

{
    xdg.configFile."caelestia".source = ./caelestia;
}
