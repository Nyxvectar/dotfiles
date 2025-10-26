{ pkgs, ... }:
{
  home.packages = with pkgs; [
    clash-meta
  ];
}
