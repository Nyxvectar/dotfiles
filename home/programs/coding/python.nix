{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python3
    python3Packages.pip
    python3Packages.virtualenv
    python3Packages.numpy
    python3Packages.matplotlib
    python3Packages.pandas
    black
    conda
  ];
}
