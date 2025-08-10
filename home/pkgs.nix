#  	By Nyxvectar Yan <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    config,
    pkgs,
    ...
}:

{
    home.packages = with pkgs;[
        discord
        eog
        element-desktop
        fastfetch
        ffmpeg
        firefox
        gnome-tweaks
        go
        grim
        hugo
        jetbrains.goland
        kew
        krita
        killall
        neovim
        nmap
        nixpkgs-review
	    obs-studio
        playerctl
        protontricks
        protonup-qt
        python314
        smartmontools
        stress-ng
        traceroute
        telegram-desktop
        texliveFull
        texstudio
        upscayl
        wechat
    ];
}
