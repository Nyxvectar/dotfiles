{ pkgs, ... }:
{
  zju-connect = pkgs.callPackage ./zju-connect.nix { };
  swhkd = pkgs.callPackage ./swhkd.nix { };
  kose-font = pkgs.callPackage ./fonts/kose.nix { };
  hugmetight-font = pkgs.callPackage ./fonts/hugmetight.nix { };
  custom-colorschemes = pkgs.callPackage ./customColorSchemes { };
  wallpapers = pkgs.callPackage ./wallpapers.nix { };
  maple-mono-variable = pkgs.callPackage ./maple-mono-variable.nix { };
}
