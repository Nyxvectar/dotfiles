{
    config,
    pkgs,
    lib,
    ...
}:

{
    i18n = {
        inputMethod = {
            enable = true;
            type = "fcitx5";
            fcitx5 = {
                addons = with pkgs; [
                    fcitx5-rime
                    fcitx5-configtool
                    fcitx5-chinese-addons
                    librime
                    rime-data
                ];
                waylandFrontend = true;
            };
        };
        defaultLocale = "en_US.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "en_HK.UTF-8";
            LC_IDENTIFICATION = "en_HK.UTF-8";
            LC_MEASUREMENT = "en_HK.UTF-8";
            LC_MONETARY = "en_HK.UTF-8";
            LC_NAME = "en_HK.UTF-8";
            LC_NUMERIC = "en_HK.UTF-8";
            LC_PAPER = "en_HK.UTF-8";
            LC_TELEPHONE = "en_HK.UTF-8";
            LC_TIME = "en_HK.UTF-8";
            LC_CTYPE = "zh_CN.UTF-8";
        };
    };

    time.timeZone = "Asia/Hong_Kong";
    fonts = {
        packages = with pkgs; [
            ubuntu-sans
            ubuntu-sans-mono
            jetbrains-mono
            noto-fonts-cjk-sans
            noto-fonts-cjk-serif
            noto-fonts-color-emoji
            nerd-fonts.ubuntu-mono
        ];
        enableDefaultPackages = true;
        fontconfig = {
            enable = true;
            antialias = true;
            hinting.enable = true;
            useEmbeddedBitmaps = true;
            defaultFonts = {
                serif = [
                    "Ubuntu"
                    "Noto Serif CJK SC"
                ];
                sansSerif = [
                    "Ubuntu"
                    "Noto Sans CJK SC"
                ];
                emoji = ["Noto Color Emoji"];
                monospace = [
                    "Ubuntu Mono Nerd Font"
                ];
            };
        };
    };
}