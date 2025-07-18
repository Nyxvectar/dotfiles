#  	Repo: github.com/Nyxvectar/dotfiles.   #
# 	Created by        github@'Nyxvectar'   #
#  	Under GPL-3.0 License,  free to use.   #
#   Maybe you need to edit the apply.sh.   #

{
    config,
    pkgs,
    lib,
    ...
}:

{
#   TODO: Install kubernetes.
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
            ];
            packages = with pkgs; [];
            shell = pkgs.fish;
        };
        root = {
            shell = pkgs.fish;
        };
    };

    security = {
        polkit = {
            enable = true;
#            rulesDirs = [
#                "/etc/polkit-1/rules.d"
#                "/nix/var/nix/profiles/default/share/polkit-1/rules.d"
#            ];
        };
        rtkit.enable = true;
    };

    virtualisation = {
        docker.enable = true;
    };

    services = {
        dbus.enable = true;
        gnome = {
            gnome-keyring.enable = true;
        };
        pipewire = {
            enable = true;
            audio.enable = true;
            pulse.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
        };
        xserver = {
            enable = true;
            displayManager.gdm.enable = true;
            xkb = {
                layout = "us";
                variant = "";
            };
        };

        v2raya.enable = true;

#       TODO: Switch to Dae & Daed.
#        dae = {
#            enable = true;
#            openFirewall = {
#                enable = true;
#                port = 12345;
#            };
#        };
#        daed = {
#            enable = true;
#            openFirewall = {
#                enable = true;
#                port = 12345;
#            };
#        };
    };
}