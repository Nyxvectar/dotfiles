#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

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
        ./fastfetch/fastfetch.nix
        ./fish/fish.nix
        ./git/git.nix
        ./hypr/hypr.nix
        ./kitty/kitty.nix
        ./pkgs.nix
        ./rofi/rofi.nix
        ./vscode/vscode.nix
        ./waybar/waybar.nix
    ];
    home.sessionVariables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        WLR_DRM_NO_ATOMIC = "1";
        TERMINAL = "alacritty";
    };
}