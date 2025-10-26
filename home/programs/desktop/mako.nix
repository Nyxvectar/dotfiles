{ pkgs, ... }:
{
  services.mako = {
    enable = true;
    settings = {
      border-size = 4;
      border-radius = 8;
    };
  };
  stylix.targets.mako.enable = true;
  home.packages = [ pkgs.libnotify ];
}
