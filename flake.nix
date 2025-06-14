{
    description = "Nyxvectar's NixOS dotfiles.";
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    outputs = { self, nixpkgs, ... }@inputs: {
        nixosConfigurations.yan = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
                modules = [
                ./configuration.nix
            ];
        };
    };
}