# 	Created by   github@'Вектарис Янов'   #
#                github@    'Nyxvectar'   #
# 	Date: Jun 06, 2025, k-v-6.15.1-zen.   #
#  	Repo: github.com/nyxvectar/nix-dot.   #
#  	Under GPL-3.0 License, free to use.   #

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
        ./imports/locale.nix
        ./imports/syspkgs.nix
        ./imports/services.nix
    ];
    system.stateVersion = "25.05";
    nixpkgs.config.allowUnfree = true;
}
