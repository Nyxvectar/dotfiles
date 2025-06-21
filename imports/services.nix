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
            extraGroups = [ "networkmanager" "wheel" "video" "render" ];
            packages = with pkgs; [];
            shell = pkgs.fish;
        };
        root = {
            shell = pkgs.fish;
        };
    };

    security = {
        rtkit.enable = true;
        polkit.enable = true;
        pam.services.gdm.enableGnomeKeyring = true;
    };

    services = {
        dbus.enable = true;
        gnome = {
            gnome-keyring.enable = true;
        };
        xserver.xkb = {
            layout = "us";
            variant = "";
        };
        pipewire = {
            enable = true;
            audio.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };
        xserver = {
            enable = true;
            displayManager.gdm.enable = true;
            desktopManager.gnome.enable = true;
        };
        v2raya.enable = true;

        dae = {
            enable = true;
            openFirewall = {
                enable = true;
                port = 12345;
            };
            disableTxChecksumIpGeneric = false;
            configFile = "/etc/dae/config.dae";
            package = inputs.daeuniverse.packages.x86_64-linux.dae;
            assets = with pkgs; [
                v2ray-geoip
                v2ray-domain-list-community
            ];
        };
    };
}