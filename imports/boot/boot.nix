#  	Repo: github.com/Nyxvectar/dotfiles     #
#   Under the MIT LICENSE, free to use.     #
#   Created by Raye Lattice  on GitHub.     #

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
