# 	Created by   github@'Вектарис Янов'   #
#                github@    'Nyxvectar'   #
# 	Date: Jan 01, 2000, kernel-v6.15.2.   #
#  	Repo: github.com/Nyxvectar/nix-dot.   #
#  	Under GPL-3.0 License, free to use.   #
#   Maybe you need to edit the apply.sh   #

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
        ./imports/options.nix
        ./imports/services.nix
        ./imports/syspkgs.nix
    ];
    system.stateVersion = "25.05";
}
