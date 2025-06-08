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
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };
    security.rtkit.enable = true;
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
        videoDrivers = [ "amdgpu" ];
    };
    services.v2raya = {
        enable = true;
    };
}