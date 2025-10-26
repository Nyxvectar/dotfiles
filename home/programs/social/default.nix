{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    telegram-desktop
    fractal
  ];
}
