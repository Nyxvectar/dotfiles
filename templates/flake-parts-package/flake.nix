{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    {
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      perSystem =
        { pkgs, ... }:
        let
          pname = pkgs.callPackage ./default.nix { };
        in
        {
          packages = {
            inherit pname;
            default = pname;
          };
        };
      systems = [ "x86_64-linux" ];
    };
}
