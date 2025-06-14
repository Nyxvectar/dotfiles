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
