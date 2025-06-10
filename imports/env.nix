{
    config,
    pkgs,
    lib,
    ...
}:

{
    # Tsinghua University Mirror Server
    nix.settings.substituters = lib.mkForce [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nix.optimise.automatic = true;

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
    environment.variables = {
        EDITOR = "nano";
        INPUT_METHOD = "fcitx5";
        XMODIFIERS = "@im=fcitx";
        XDG_CURRENT_DESKTOP = "Hyprland";
    };

    environment.systemPackages = [
        inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    ];
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
    };
}
