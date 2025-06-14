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
        v2raya = {
                enable = true;
        };
    };
}