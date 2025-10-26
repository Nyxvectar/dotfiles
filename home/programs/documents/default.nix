{ inputs, pkgs, ... }:
{
  imports = [
    ./zathura.nix
  ];
  home.packages = with pkgs; [
    libreoffice
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.onlyoffice-desktopeditors
  ];
}
