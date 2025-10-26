{
  self,
  lib,
  host,
  user,
  ...
}:
let
  cfg = self.homeConfigurations."${user}@${host}".config;
in
{
  stylix =
    {
      enable = true;
      autoEnable = false;
      targets = {
        console.enable = true;
        gnome.enable = true;
        grub.enable = true;
        plymouth.enable = true;
      };
    }
    // (
      if builtins.hasAttr "base16Scheme" cfg.stylix then
        { base16Scheme = lib.mkDefault cfg.stylix.base16Scheme; }
      else
        { }
    )
    // (
      if builtins.hasAttr "image" cfg.stylix then { image = lib.mkDefault cfg.stylix.image; } else { }
    );
  specialisation = builtins.mapAttrs (name: value: {
    configuration = {
      stylix =
        (
          if builtins.hasAttr "base16Scheme" value.configuration.stylix then
            { base16Scheme = lib.mkForce cfg.specialisation.${name}.configuration.stylix.base16Scheme; }
          else
            { }
        )
        // (
          if builtins.hasAttr "image" value.configuration.stylix then
            { image = lib.mkForce cfg.specialisation.${name}.configuration.stylix.image; }
          else
            { }
        );
      environment.etc."specialisation".text = name;
    };
  }) cfg.specialisation;
}
