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
    boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        kernelParams = [ "pid_namespaces=1" ];
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        extraModprobeConfig = ''
            options hid_apple fnmode=0
        '';
    };
}
