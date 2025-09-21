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
    users.users = {
        vespr = {
            isNormalUser = true;
            description = "Vespr";
            extraGroups = [
                "networkmanager"
                "wheel"
                "video"
                "render"
                "boinc"
            ];
            packages = with pkgs; [];
            shell = pkgs.fish;
        };
        root = {
            shell = pkgs.fish;
        };
    };
    users.extraGroups.vboxusers.members = [ "vespr" ];

    security = {
        polkit.enable = true;
        rtkit.enable = true;
        doas.enable = true;
        sudo.enable = false;
        doas.extraRules = [{
            users = [ "vespr" ];
            keepEnv = true;
            persist = true;
        }];
    };

    virtualisation.vmware.host.enable = false;
    virtualisation.vmware.guest.enable = false;
    virtualisation.virtualbox.host.enable = false;
    virtualisation.waydroid.enable = false;

    services = {
        dbus.enable = true;
        displayManager.ly.enable = true;
        fail2ban.enable = true;
        pipewire = {
            enable = true;
            audio.enable = true;
            pulse.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
        };
        xserver = {
            enable = true;
            # videoDrivers = [ "vmware" ];
            xkb = {
                layout = "us";
                variant = "";
            };
        };
        daed = {
            enable = true;
            openFirewall = {
                enable = true;
                port = 12345;
            };
            listen = "127.0.0.1:2044";
        };
        boinc = {
            enable = true;
            extraEnvPackages = [
                pkgs.libglvnd
                pkgs.brotli
            ];
        };
        openssh = {
            enable = true;
            ports = [ 2077 ];
            settings = {
                PasswordAuthentication = false;
                KbdInteractiveAuthentication = false;
                PermitRootLogin = "no";
                AllowUsers = [ "vespr" ];
            };
        };
        endlessh = {
            enable = true;
            port = 22;
            openFirewall = true;
        };
        tailscale.enable = false;
    };
}
