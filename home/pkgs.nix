#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    config,
    pkgs,
    ...
}:

{
    home.packages = with pkgs;[
        alacritty
        blueman
        kdePackages.breeze
        libsForQt5.breeze-icons
        discord
        eog
        # Matrix not well for me to use.
        # element-desktop
        fastfetch
        ffmpeg
        flameshot
        firefox
        gnome-tweaks
        go
        godot
        grim
        # gh
        hugo
        # No money for keeping license :(
        # jetbrains.goland
        jetbrains.rust-rover
        jetbrains.webstorm
        kew
        krita
        killall
        libnotify
        neovim
        nmap
        # redundant niri declaration
        nixpkgs-review
        nodejs_24
        obs-studio
        playerctl
        protontricks
        protonup-qt
        python314
        qq
        smartmontools
        stress-ng
        # Spotify would cause core-dump.
        # spotify
        swaybg
        swayidle
        traceroute
        telegram-desktop
        texliveFull
        texstudio
        typescript
        upscayl
        wechat
        wpsoffice
        wshowkeys
        xwayland-satellite
    ];
}