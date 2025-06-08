{
    config,
    pkgs,
    lib,
    ...
}:
{
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.initrd.kernelModules = [ "amdgpu" ];
    boot.extraModprobeConfig = ''
        options hid_apple fnmode=0
	# If ur keybr has some 'advanced' functions
	# U maybe had found that F-key ineffective.
    '';
    boot.kernelPackages = pkgs.linuxPackages_latest;
}
