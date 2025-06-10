{
    config,
    pkgs,
    lib,
    ...
}:
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.extraModprobeConfig = ''
        options hid_apple fnmode=0
    '';
    boot.kernelPackages = pkgs.linuxPackages_latest;
}
