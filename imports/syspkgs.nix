{
    pkgs,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
    	# Kernel
    	linux-firmware
    	mesa
    	# Commands & Net
    	fish
    	eza
    	vim
    	wget
    	firefox
    	git
    	rsync
    	curl
    	unzip
    	unrar
    	v2ray
    	v2raya
    	stress-ng
    	# Fonts
    	fontconfig
    	# Info Fetch
    	fastfetch
    	gnome-tweaks
    	mission-center
    	htop
    	btop
    	smartmontools
    	furmark
    	amdgpu_top
    	# DE & WM
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
    	gdm-settings
    	rofi-wayland
    	mako
    	fcitx5
    	fcitx5-rime
    	whitesur-gtk-theme
    	whitesur-icon-theme
    	wl-clipboard
    	# Dev
    	go
    	jdk
    	python314
    	vscode
    	jetbrains.goland
    	jetbrains.pycharm-professional
    	element-desktop
    	# Media
    	pipewire
    	wireplumber
    	pavucontrol
    	playerctl
    	krita
    	telegram-desktop
    	discord
    	wechat-uos
    	qq
    	eog
    	grim
    	mpv
    	obs-studio
    	upscayl
        # Fix
        coreutils
        lsof
        glibc
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