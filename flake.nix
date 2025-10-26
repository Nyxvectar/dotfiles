{
  description = "Eden's NixOS Flake";

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        ./hosts
        inputs.treefmt-nix.flakeModule
        { _module.args = { inherit inputs self nixpkgs; }; }
      ];
      flake = {
        homeManagerModules = import ./modules/home-manager;
        overlays = import ./overlays { inherit inputs self; };
        templates = import ./templates;
      };
      perSystem =
        { pkgs, ... }:
        {
          packages = import ./pkgs { inherit pkgs; };
          treefmt = {
            projectRootFile = "flake.nix";
            programs.nixfmt.enable = true;
            programs.ruff-format.enable = true;
            programs.prettier.enable = true;
            programs.beautysh.enable = true;
            programs.toml-sort.enable = true;
            settings.global.excludes = [ "*.age" ];
            settings.formatter = {
              jsonc = {
                command = "${pkgs.nodePackages.prettier}/bin/prettier";
                includes = [ "*.jsonc" ];
              };
              scripts = {
                command = "${pkgs.beautysh}/bin/beautysh";
                includes = [ "*/scripts/*" ];
              };
            };
          };
        };
    };

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    # niri-unstable = {
    #   url = "github:YalTeR/niri";
    #   # url = "github:visualglitch91/niri/feat/blur-lite";
    #   flake = false;
    # };
    niri = {
      url = "github:sodiboo/niri-flake";
      # inputs.niri-unstable.follows = "niri-unstable";
    };
    nur.url = "github:nix-community/NUR";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixd = {
      url = "github:nix-community/nixd";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nh.url = "github:nix-community/nh";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    agenix.url = "github:ryantm/agenix";
    mangowc.url = "github:DreamMaoMao/mangowc";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nix-matlab = {
      url = "gitlab:doronbehar/nix-matlab";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ghostty.url = "github:ghostty-org/ghostty";
    nixGL.url = "github:nix-community/nixGL";
    quickshell = {
      url = "git+https://git.outfoxxed.me/quickshell/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.quickshell.follows = "quickshell";
    };
    niri-caelestia-shell = {
      url = "github:jutraim/niri-caelestia-shell";
      inputs.quickshell.follows = "quickshell";
    };
    caelestia-cli.url = "github:caelestia-dots/cli";
    noctalia-shell = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.quickshell.follows = "quickshell";
    };
    hexecute.url = "github:ThatOtherAndrew/Hexecute";
  };
}
