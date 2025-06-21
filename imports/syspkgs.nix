{
    pkgs,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
    	linux-firmware
    	mesa
    	fish
    	eza
    	vim
    	wget
    	git
    	rsync
    	curl
    	unzip
    	unrar
    	fontconfig
    	amdgpu_top
    	wayland
    	xwayland
    	alacritty
    	kitty
    	hyprland
    	hyprlock
    	hyprcursor
    	hyprpaper
    	hyprutils
    	waybar
    	rofi-wayland
    	mako
    	whitesur-gtk-theme
    	whitesur-icon-theme
    	wl-clipboard
    	pipewire
    	wireplumber
    	pavucontrol
    	playerctl
        coreutils
        lsof
        glibc
        slurp
        protontricks
        winetricks
        vulkan-tools
        vulkan-loader
        protonup-qt
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