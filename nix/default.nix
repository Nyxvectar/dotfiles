{ nixpkgs, ... }:
{
  imports = [
    ./substituters.nix
    ./nh.nix
    ./nixpkgs.nix
  ];

  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];
    nixPath = [ "nixpkgs=${nixpkgs}" ];
  };
}
