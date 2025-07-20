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

#    home.file = {
#        ".local/share/fcitx5/themes".source =
#            config.lib.file.mkOutOfStoreSymlink ./annex/themes;
#        ".config".source =
#            config.lib.file.mkOutOfStoreSymlink ./home;
#        ".config".force = true;
#    };

    home.packages = with pkgs;[
        discord
        eog
        element-desktop
        fastfetch
        firefox
        gnome-tweaks
        go
        grim
        htop
        hugo
        jetbrains.goland
        krita
        killall
        kitty
        obs-studio
        playerctl
        protontricks
        protonup-qt
        smartmontools
        stress-ng
        telegram-desktop
        texliveFull
        texstudio
        upscayl
        wechat-uos
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