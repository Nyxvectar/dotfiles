# 	Created by   github@'Вектарис Янов'   #
#                github@    'Nyxvectar'   #
# 	Date: Jun 06, 2025, k-v-6.15.1-zen.   #
#  	Repo: github.com/nyxvectar/nix-dot.   #
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
        ./imports/services.nix
        ./imports/syspkgs.nix
    ];
    system.stateVersion = "25.05";
}
