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

    services = {
        dbus.enable = true;
        pipewire = {
            enable = true;
            audio.enable = true;
            pulse.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
        };
        displayManager.ly.enable = true;
        xserver = {
            enable = true;
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
        fail2ban.enable = true;
        openssh = {
            enable = true;
            ports = [ 2077 ];
            settings = {
                PasswordAuthentication = false;
                KbdInteractiveAuthentication = false;
                PermitRootLogin = "no";
                AllowUsers = [ "paper_calc" ];
            };
        };
        endlessh = {
            enable = true;
            port = 22;
            openFirewall = true;
        };
        # tailscale.enable = true;
    };
}