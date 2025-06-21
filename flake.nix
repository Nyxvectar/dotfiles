# 	Created by   github@'Вектарис Янов'   #
#                github@    'Nyxvectar'   #
# 	Date: Jan 01, 2000, kernel-v6.15.2.   #
#  	Repo: github.com/Nyxvectar/nix-dot.   #
#  	Under GPL-3.0 License, free to use.   #
#   Maybe you need to edit the apply.sh   #

{
    description = "Nyxvectar's NixOS dotfiles.";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        daeuniverse.url = "github:daeuniverse/flake.nix";
        unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        rose-pine-hyprcursor = {
            url = "github:ndom91/rose-pine-hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, unstable, ... }@inputs: {
        nixosConfigurations.yan = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs;
            };
            modules = [
                ./configuration.nix
                inputs.daeuniverse.nixosModules.dae
                inputs.daeuniverse.nixosModules.daed
            ];
        };
    };
}