#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    inputs,
    caelestia-shell,
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
        #hyprlock
        #hyprlang
        #hyprpaper
        hyprutils
        lsof
        linux-firmware
        libgcc
        mesa
        mpv
        nautilus
        pavucontrol
        pipewire
        rsync
        rustc
        rustup
        slurp
        #snixembed
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
        whitesur-gtk-theme
        adwaita-icon-theme
        wayland
        xwayland
        inputs.caelestia-shell.packages.${pkgs.system}.default
        inputs.caelestia-shell.packages.${pkgs.system}.with-cli
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
        inputs.caelestia-shell.inputs.caelestia-cli.packages.${system}.caelestia-cli
    ];

    programs = {
#        caelestia-shell = {
#            enable = true;
#            package = [
#                inputs.caelestia-shell.packages.${pkgs.system}.default
#                inputs.caelestia-shell.packages.${pkgs.system}.with-cli
#            ];
#        };
        fish.enable = true;
        niri = {
            enable = true;
            package = pkgs.niri;
        };
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
