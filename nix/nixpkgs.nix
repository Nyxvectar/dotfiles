{ self, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
        "electron-19.1.9"
      ];
      allowUnsupportedSystem = true;
    };
    overlays = builtins.attrValues self.overlays;
  };
}
