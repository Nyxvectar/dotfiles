#  	Repo: github.com/Nyxvectar/dotfiles.   #
# 	Created by        github@'Nyxvectar'   #
#  	Under GPL-3.0 License,  free to use.   #
#   Maybe you need to edit the apply.sh.   #

{
    pkgs,
    inputs,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        amdgpu_top
        alacritty
        coreutils
        curl
        eza
        git
        glibc
        hyprcursor
        hyprlock
        hyprlang
        hyprpolkitagent
        hyprpaper
        hyprutils
        lsof
        linux-firmware
        mako
        mesa
        mpv
        nautilus
        pavucontrol
        pipewire
        rsync
        rofi-wayland
        slurp
        unrar
        unzip
        vulkan-loader
        vulkan-tools
        vim
        v2ray
        v2raya
        wl-clipboard
        winetricks
        wireplumber
        wget
        whitesur-icon-theme
        whitesur-gtk-theme
        wayland
        xwayland
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];

    programs = {
        fish.enable = true;
        waybar.enable = true;
        hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
            # The option "withHyprPolkitAgent = true" does not exist.
            # "systemctl --user enable --now hyprpolkitagent.service"
            # The command above might be a good choice.
        };
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
        };
    };
}