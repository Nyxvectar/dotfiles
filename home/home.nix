#  	Repo: github.com/Nyxvectar/dotfiles     #
#   Under the MIT LICENSE, free to use.     #
#   Created by Nyxvectar Yan on GitHub.     #

{
    config,
    pkgs,
    ...
}:

{
    home.username = "vespr";
    home.homeDirectory = "/home/vespr";
    home.stateVersion = "25.05";
    home.enableNixpkgsReleaseCheck = false;
    imports = [
        ./pkgs.nix
        ./vscode/vscode.nix
        ./alacritty/alacritty.nix
        ./kitty/kitty.nix
        ./rofi/rofi.nix
        ./git/git.nix
        ./waybar/waybar.nix
    ];
}