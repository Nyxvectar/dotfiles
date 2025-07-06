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
    };

    services = {
        dbus.enable = true;
        systembus-notify.enable = true;
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
            pulse.enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
        };
        xserver = {
            enable = true;
#            displayManager.gdm.enable = true;
#            desktopManager.gnome.enable = true;
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