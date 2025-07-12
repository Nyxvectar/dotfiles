{ config, pkgs, ...}:

{
    home.username = "vespr";
    home.homeDirectory = "/home/vespr";
    home.stateVersion = "25.05";
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
        mpv
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
        vscode
        wechat-uos
    ];
}