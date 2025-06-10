{
    config,
    pkgs,
    lib,
    ...
}:

{
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    users.users.vespr = {
        isNormalUser = true;
        description = "Vespr";
        extraGroups = [ "networkmanager" "wheel" "video" "render" ];
        packages = with pkgs; [];
        shell = pkgs.fish;
    };
    users.users.root = {
        shell = pkgs.fish;
    };

    security.rtkit.enable = true;
    security.polkit.enable = true;

    services.gnome.gnome-keyring.enable = true;
    security.pam.services.gdm.enableGnomeKeyring = true;

    services.pipewire = {
        enable = true;
        audio.enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    services.xserver = {
        enable = true;
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    services.v2raya = {
        enable = true;
    };
}