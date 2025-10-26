#   By Raye Lattice <nyxvectar@proton.me>   #
#   Under the MIT LICENSE, free to use.     #

{
    description = "Raye Lattice's NixOS dotfiles.";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
        # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        caelestia-shell = {
            url = "github:caelestia-dots/shell";
            #inputs.nixpkgs.follows = "nixpkgs";
        };
        daeuniverse.url = "github:daeuniverse/flake.nix";
        rose-pine-hyprcursor = {
            url = "github:ndom91/rose-pine-hyprcursor";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        vscode-extensions = {
            url = "github:nix-community/nix-vscode-extensions";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = {
        self,
        nixpkgs,
        home-manager,
        vscode-extensions,
        ...
        } @inputs: {
        nixosConfigurations.yan = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = {
                inherit inputs;
            };
            modules = [
                ./imports/configuration.nix
                ./hardware-configuration.nix
                inputs.daeuniverse.nixosModules.dae
                inputs.daeuniverse.nixosModules.daed
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.users.vespr = import ./home/home.nix;
                    home-manager.extraSpecialArgs = inputs;
                }
            ];
        };
    };
}
