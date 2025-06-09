# 	Created by   github@'Вектарис Янов'   #
#                github@    'Nyxvectar'   #
# 	Date: Jun 06, 2025, on NixOS 25.05.   #
#  	Repo: github.com/nyxvectar/nix-dot.   #
#  	Under GPL-3.0 License, free to use.   #

{
    description = "A simple NixOS flake";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
            ];
        };
    };
}