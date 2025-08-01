#  	Repo: github.com/Nyxvectar/dotfiles     #
#   Under the MIT LICENSE, free to use.     #
#   Created by Nyxvectar Yan on GitHub.     #

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
        btop
        coreutils
        curl
        eza
        git
        glibc
        hyprcursor
        hyprlock
        hyprlang
        hyprpaper
        hyprutils
        lsof
        linux-firmware
        libgcc
        mesa
        mpv
        swaynotificationcenter
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
        wl-clipboard
        winetricks
        wireplumber
        wget
        whitesur-cursors
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