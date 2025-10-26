{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    { ... }@inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      perSystem =
        { pkgs, ... }:
        {
          devShells = {
            default =
              let
                packageOverrides = pkgs.callPackage ./python-packages.nix { };
                python = pkgs.python312.override { inherit packageOverrides; };
              in
              pkgs.mkShellNoCC {
                buildInputs = [
                  (python.withPackages (
                    ps: with ps; [
                      numpy
                      pandas
                      openpyxl
                      scipy
                      requests
                      matplotlib
                      scikit-learn
                      seaborn
                      pingouin
                    ]
                  ))
                ];
                shellHook = ''
                  fish
                '';
              };
          };
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
            programs.ruff-format.enable = true;
          };
        };
    };
}
