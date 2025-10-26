{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alejandra
    nixfmt-rfc-style
    texlab
    nodePackages.prettier
  ];
}
