#  	Repo: github.com/Nyxvectar/dotfiles     #
#   Under the MIT LICENSE, free to use.     #
#   Created by Nyxvectar Yan on GitHub.     #

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
