{
    config,
    pkgs,
    lib,
    ...
}:
{
    boot = {
        kernelPackages = pkgs.linuxPackages_latest;
        loader.systemd-boot.enable = true;
        loader.efi.canTouchEfiVariables = true;
        extraModprobeConfig = ''
            options hid_apple fnmode=0
        '';
    };
}
