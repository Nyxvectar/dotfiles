{
    config,
    pkgs,
    lib,
    ...
}:

{
    i18n.inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5.addons = with pkgs; [
                fcitx5-gtk
                fcitx5-rime
                fcitx5-chinese-addons
                librime
                rime-data
        ];
    };
    fonts.packages = with pkgs; [
        ubuntu-sans
        ubuntu-sans-mono
        jetbrains-mono
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        nerd-font-patcher
    ];
    time.timeZone = "Asia/Shanghai";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_HK.UTF-8";
        LC_IDENTIFICATION = "en_HK.UTF-8";
        LC_MEASUREMENT = "en_HK.UTF-8";
        LC_MONETARY = "en_HK.UTF-8";
        LC_NAME = "en_HK.UTF-8";
        LC_NUMERIC = "en_HK.UTF-8";
        LC_PAPER = "en_HK.UTF-8";
        LC_TELEPHONE = "en_HK.UTF-8";
        LC_TIME = "en_HK.UTF-8";
    };
}