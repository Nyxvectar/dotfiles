{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # pspp
    zotero
  ];
}
