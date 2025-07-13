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
        hyprpaper
        hyprutils
        lsof
        linux-firmware
        mako
        mesa
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
        hyprland.enable = true;
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
        };
    };
}