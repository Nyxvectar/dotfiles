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
        fish
        git
        glibc
        hyprcursor
        hyprland
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
        wl-clipboard
        winetricks
        wireplumber
        wget
        whitesur-icon-theme
        whitesur-gtk-theme
        waybar
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