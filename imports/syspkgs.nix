{
    pkgs,
    ...
}:

{
    environment.systemPackages = with pkgs; [
    	# Kernel
    	linux-firmware
    	linuxKernel.kernels.linux_zen

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

    	# Fonts
    	fontconfig

    	# Info Fetch
    	fastfetch
    	gnome-tweaks
    	mission-center
    	htop
    	btop
    	smartmontools

    	# DE & WM
    	wayland
    	alacritty
    	kitty
    	hyprland
    	hyprlock
    	hyprpaper
    	hyprcursor
    	hyprutils
    	hyprshot
    	pyprland
    	xwayland
    	waybar
    	rofi-wayland
    	mako
    	fcitx5
    	fcitx5-rime
    	fcitx5-gtk
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

    	# Media
    	pipewire
    	telegram-desktop
    	discord
    	wechat-uos
    	qq
    	eog
    	grim
    	mpv
    	obs-studio
    ];
}