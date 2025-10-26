{ inputs, pkgs, ... }:
{
  boot = {
    kernelPackages = inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.linuxPackages_zen;
    kernelParams = [
      "loglevel=3"
      "quiet"
      "splash"
      "console=tty1"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
    loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        extraEntriesBeforeNixOS = true;
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }
          menuentry "Poweroff" {
            halt
          }
        '';
        default = "saved";
      };
      efi.efiSysMountPoint = "/boot";
    };
    plymouth.enable = true;
  };
}
