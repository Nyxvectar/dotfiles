#  	Repo: github.com/Nyxvectar/dotfiles.   #
# 	Created by        github@'Nyxvectar'   #
#  	Under GPL-3.0 License,  free to use.   #
#   Maybe you need to edit the apply.sh.   #

{
    config,
    pkgs,
    lib,
    ...
}:

{
    nix = {
        settings = {
            substituters = lib.mkForce [
                "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
                "https://cache.nixos.org"
            ];
            # substituters = lib.mkForce [];
            experimental-features = [
                "nix-command"
                "flakes"
            ];
        };
        optimise.automatic = true;
    };

    environment = {
        sessionVariables = {
            NIXOS_OZONE_WL = "1";
            WLR_NO_HARDWARE_CURSORS = "1";
        };
        variables = {
            EDITOR = "nano";
            QT_IM_MODULE = "fcitx";
            GTK_IM_MODULE = "fcitx";
            GLFW_IM_MODULE = "ibus";
            XMODIFIERS = "@im=fcitx";
            XDG_CURRENT_DESKTOP = "Hyprland";
        };
    };

    networking.hostName = "yan";
    networking.networkmanager.enable = true;

    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
        };
        amdgpu.amdvlk = {
            enable = true;
            support32Bit.enable = true;
        };
    };
}
