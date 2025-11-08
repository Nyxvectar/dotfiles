#  	By Raye Lattice  <nyxvectar@proton.me>  #
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
        ./vscode/vscode.nix
        ./cae/cae.nix
        #./rofi/rofi.nix
        #./niri/niri.nix
    ];

    home.sessionVariables = {
        XDG_CURRENT_DESKTOP = "Hyprland";
        WLR_DRM_NO_ATOMIC = "1";
        TERMINAL = "kitty";
    };

    gtk = {
        enable = true;
        iconTheme = {
            name = "WhiteSur-dark";
            package = pkgs.whitesur-icon-theme;
        };
    };

    qt = {
        enable = true;
        style.name = "adwaita-dark";
        platformTheme.name = "gtk3";
    };
}
