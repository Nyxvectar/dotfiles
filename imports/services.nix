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
                "docker"
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

    virtualisation = {
        docker.enable = true;
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
            settings.PermitRootLogin = "no";
            settings.PasswordAuthentication = true;
        };
        tailscale.enable = true;
    };
}