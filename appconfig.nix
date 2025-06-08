{
    config,
    pkgs,
    lib,
    ...
}:

{
    import =
    [
        #./appconfig/alacritty.nix
        #./appconfig/hyprland.nix
        #./appconfig/hyprlock.nix
        #./appconfig/hyprpaper.nix
        #./appconfig/mako.nix
        #./appconfig/rofi.nix
        #./appconfig/waybar.nix
    ];
}