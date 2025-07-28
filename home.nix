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
        ./home/pkgs.nix
    ];
    programs = {
        vscode = {
            enable = true;
        };
        git = {
            enable = true;
            userName = "Nyxvectar Yan";
            userEmail = "Nyxvectar@proton.me";
        };
    };
}