{
  pkgs,
  config,
  lib,
  ...
}:
let
  convertColorScheme =
    colorScheme:
    if builtins.typeOf colorScheme == "string" then
      {
        name = colorScheme;
        isDefault = false;
        polarity = "dark";
        fromImage.enable = false;
      }
    else
      colorScheme;

  getImage = image: if builtins.typeOf image == "path" then image else "${pkgs.wallpapers}/${image}";

  matugenToBase16 =
    colorScheme:
    let
      inherit (colorScheme) name polarity fromImage;
      image = getImage fromImage.image;
      scheme = if builtins.hasAttr "scheme" fromImage.passthru then fromImage.passthru.scheme else null;
    in
    pkgs.runCommand "${name}.yaml" { buildInputs = [ pkgs.matugen ]; }
      # bash
      ''
        ${pkgs.python3}/bin/python ${./matu2base16.py} ${image} \
        --name ${name} --polarity ${polarity} --type ${scheme} --output $out
      '';

  hellwalToBase16 =
    colorScheme:
    let
      inherit (colorScheme) name polarity fromImage;
      image = getImage fromImage.image;
    in
    pkgs.runCommand "${name}.yaml" { buildInputs = [ pkgs.hellwal ]; }
      # bash
      ''
        ${pkgs.python3}/bin/python ${./hellwal2base16.py} ${image} \
        --name ${name} --polarity ${polarity} --output $out
      '';

  buildColorScheme =
    colorScheme:
    let
      inherit (colorScheme)
        name
        isDefault
        polarity
        fromImage
        ;
      forceOrDefault = if isDefault then lib.mkDefault else lib.mkForce;
    in
    (
      if fromImage.enable then
        let
          inherit (fromImage) method;
        in
        if method == "matugen" then
          {
            base16Scheme = forceOrDefault "${matugenToBase16 colorScheme}";
          }
        else
          {
            base16Scheme = forceOrDefault "${hellwalToBase16 colorScheme}";
          }
      else
        {
          base16Scheme = forceOrDefault "${pkgs.base16-schemes}/share/themes/${name}.yaml";
        }
    )
    // {
      inherit polarity;
    };

  buildSpecialisation =
    colorScheme:
    let
      inherit (colorScheme) name;
    in
    {
      inherit name;
      value.configuration = {
        stylix = buildColorScheme colorScheme;
        xdg.dataFile."home-manager/specialisation".text = name;
      };
    };
in
{
  lib.colorScheme = {
    inherit convertColorScheme buildColorScheme buildSpecialisation;
  };
}
