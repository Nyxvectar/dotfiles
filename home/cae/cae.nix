#  	By Raye Lattice  <nyxvectar@proton.me>  #
#   Under the MIT LICENSE, free to use.     #

{
    pkgs,
    config,
    ...
}:

{
#    programs.caelestia = {
#        enable = true;
#        cli.enable = true;
#        systemd = {
#            enable = true;
#        };
#        settings = {
#            paths.wallpaperDir = "~/Pictures/Wallpapers";
#            bar.status.showAudio = true;
#            general.apps = {
#                explorer = "thunar";
#            };
#        };
#    };
    xdg.configFile."caelestia".source = ./caelestia;
}
