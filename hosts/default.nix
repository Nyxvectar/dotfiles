{
  inputs,
  nixpkgs,
  self,
  ...
}:
let
  sharedOSModules = [
    ../os
    ../nix
    inputs.stylix.nixosModules.stylix
    inputs.niri.nixosModules.niri
    # inputs.mangowc.nixosModules.mango
  ];

  sharedHomeModules = [
    ../home
    ../nix/nixpkgs.nix
    inputs.stylix.homeModules.stylix
    inputs.niri.homeModules.niri
    inputs.nixvim.homeModules.nixvim
    inputs.agenix.homeManagerModules.default
    ../secrets/age.nix
    # inputs.mangowc.hmModules.mango
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.niri-caelestia-shell.homeManagerModules.default
    inputs.noctalia-shell.homeModules.default
  ]
  ++ (builtins.attrValues self.homeManagerModules);

  mkHost =
    {
      host,
      user,
      extraOSModules ? [ ],
      extraOSArgs ? { },
      extraHomeModules ? [ ],
      extraHomeArgs ? { },
      ...
    }:
    {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            nixpkgs
            self
            host
            user
            ;
        }
        // extraOSArgs;
        modules = extraOSModules ++ sharedOSModules;
      };

      homeConfigurations."${user}@${host}" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-linux";
        extraSpecialArgs = {
          inherit
            inputs
            self
            host
            user
            ;
        }
        // extraHomeArgs;
        modules = extraHomeModules ++ sharedHomeModules;
      };
    };

in
{
  flake = import ./hosts.nix |> map mkHost |> builtins.foldl' (x: y: x // y) { };
}
