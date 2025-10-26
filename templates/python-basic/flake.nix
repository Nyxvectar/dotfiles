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
                python = pkgs.python312;
              in
              pkgs.mkShellNoCC {
                buildInputs = [
                  (python.withPackages (
                    ps: with ps; [
                      numpy
                      pandas
                      openpyxl
                      scipy
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
