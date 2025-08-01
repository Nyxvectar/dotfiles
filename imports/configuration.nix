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
        ./boot/boot.nix
        ./env/env.nix
        ./locale/locale.nix
        ./services/services.nix
        ./packages/syspkgs.nix
    ];
    system.stateVersion = "25.05";
}
