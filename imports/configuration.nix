#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    config,
    pkgs,
    lib,
    ...
}:

{
    imports =
    [
        ./boot/boot.nix
        ./env/env.nix
        ./locale/locale.nix
        ./services/services.nix
        ./packages/syspkgs.nix
    ];
    system.stateVersion = "25.05";
}
