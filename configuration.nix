#  	Repo: github.com/Nyxvectar/dotfiles.   #
# 	Created by        github@'Nyxvectar'   #
#  	Under GPL-3.0 License,  free to use.   #
#   Maybe you need to edit the apply.sh.   #

{
    config,
    pkgs,
    lib,
    ...
}:
{
    imports =
    [
        ./hardware-configuration.nix
        ./imports/boot.nix
        ./imports/env.nix
        ./imports/locale.nix
        ./imports/services.nix
        ./imports/syspkgs.nix
    ];
    system.stateVersion = "25.05";
}
