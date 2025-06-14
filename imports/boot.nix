{
    config,
    pkgs,
    lib,
    ...
}:
{
    boot.kernelPackages = pkgs.linuxPackages_lastest;
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.extraModprobeConfig = ''
        options hid_apple fnmode=0
    '';
}
