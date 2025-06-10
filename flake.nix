# 	Created by   github@'Вектарис Янов'   #
#                github@    'Nyxvectar'   #
# 	Date: Jun 06, 2025, on NixOS 25.05.   #
#  	Repo: github.com/nyxvectar/nix-dot.   #
#  	Under GPL-3.0 License, free to use.   #
#   Maybe you need to edit the apply.sh   #

{
    description = "A simple NixOS flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        hyprland.url = "github:hyprwm/hyprland?ref=v0.49.0";

        rose-pine-hyprcursor = {
            url = "github:ndom91/rose-pine-hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
            inputs.hyprlang.follows = "hyprland/hyprlang";
        };
    };
    outputs = { self, nixpkgs, unstable, ... }@inputs: {
        nixosConfigurations = {
            laptop01 = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/laptop01/configuration.nix
                ];
            };
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                ];
            };
        };
    };
}