#  	Repo: github.com/Nyxvectar/dotfiles     #
#   Under the MIT LICENSE, free to use.     #
#   Created by Nyxvectar Yan on GitHub.     #

{
    config,
    pkgs,
    lib,
    ...
}:

{
    nix = {
        settings = {
#            substituters = lib.mkForce [
#                "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
#                "https://cache.nixos.org"
#            ];
            substituters = lib.mkForce [];
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
            XMODIFIERS = "@im=fcitx";
            XDG_CURRENT_DESKTOP = "Hyprland";
        };
    };

    networking.hostName = "yan";
    networking.networkmanager.enable = true;
    virtualisation.virtualbox.host.enable = true;
    # virtualisation.waydroid.enable = true;
    # networking.firewall.allowedUDPPorts = [ 41641 ];

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
