#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    inputs,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        amdgpu_top
        btop
        coreutils
        curl
        cmake
        eza
        gcc
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
        mako
        mesa
        mpv
        nautilus
        pavucontrol
        pipewire
        rsync
        rustc
        rustup
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
        adwaita-icon-theme
        hicolor-icon-theme
        whitesur-gtk-theme
        wayland
        xwayland
        inputs.caelestia-shell.packages.${pkgs.system}.default
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];

    programs = {
        fish.enable = true;
        hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
        };
        steam = {
            enable = true;
            remotePlay.openFirewall = true;
            dedicatedServer.openFirewall = true;
            localNetworkGameTransfers.openFirewall = true;
        };
    };
}
