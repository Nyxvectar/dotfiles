{
  pkgs,
  config,
  ...
}:
{
  home.packages = with pkgs; [
    zoxide
    gnome-tweaks
    networkmanagerapplet
    wayland-logout
    wl-clipboard
    sd
    socat
    pandoc
    # typst
    du-dust
    killall
    htop
    gparted
    gimp3
    kdePackages.kdenlive
    # tesseract # ocr
    # marp-cli
    appimage-run
    # audiowaveform
    # papers
    # nom
    yad
    # pcmanfm
    # yazi
    # ydotool
    jq
    # scrcpy
    direnv
    entr
    lutgen
    matugen
    hellwal
    imagemagick
    ffmpeg
    nurl
    nix-init
    wl-color-picker
    (config.lib.misc.addFlags "--wayland-text-input-version=3" "cherry-studio" cherry-studio)
  ];
  imports = [
    ./eye-candy.nix
    ./obs.nix
    ./music.nix
    ./ai.nix
  ];
  programs.pay-respects.enable = true;
}
