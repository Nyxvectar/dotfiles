{
    config,
    pkgs,
    lib,
    ...
}:

{
    nix = {
        settings = {
            substituters = lib.mkForce [ "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
        };
        optimise.automatic = true;
    };

    environment = {
        sessionVariables = {
            NIXOS_OZONE_WL = "1";
            WLR_NO_HARDWARE_CURSORS = "1";
        };
        variables = {
                EDITOR = "vim";
                GTK_IM_MODULE= "fcitx5";
                QT_IM_MODULE= "fcitx5";
                XMODIFIERS = "@im=fcitx";
                XDG_CURRENT_DESKTOP = "Hyprland";
        };
    };

    networking = {
        hostName = "yan";
        networkmanager.enable = true;
    };

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
