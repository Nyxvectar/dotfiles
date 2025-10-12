#  	By Raye Lattice  <nyxvectar@proton.me>  #
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
        # Matrix not well for me to use.
        # element-desktop
        fastfetch
        ffmpeg
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
        neovim
        nmap
        nixpkgs-review
        nodejs_24
	    obs-studio
        playerctl
        protontricks
        protonup-qt
        python314
        smartmontools
        stress-ng
        # Spotify would cause core-dump.
        # spotify
        traceroute
        telegram-desktop
        texliveFull
        texstudio
        typescript
        upscayl
        wechat
        wpsoffice
    ];
}
