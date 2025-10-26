{ config, lib, ... }:
with lib;
with types;
let
  fromImageOptions = submodule {
    options = {
      enable = mkEnableOption "Enable generating colorscheme from image";
      image = mkOption {
        type = either str path;
        description = "Path to the image";
      };
      method = mkOption {
        type = enum [
          "matugen"
          "hellwal"
          "stylix"
        ];
        description = "The method to use to generate the colorscheme";
        default = "matugen";
      };
      passthru = mkOption {
        type = attrs;
        description = "Passthru options to the method";
      };
    };
  };

  colorScheme = submodule {
    options = {
      name = mkOption {
        type = str;
        description = "Name of the color scheme";
      };
      isDefault = mkOption {
        type = bool;
        description = "Whether the color scheme is the default";
        default = false;
      };
      polarity = mkOption {
        type = enum [
          "dark"
          "light"
        ];
        description = "Polarity of the color scheme (dark or light)";
        default = "dark";
      };
      fromImage = mkOption {
        type = fromImageOptions;
        description = "Options for generating colorscheme from image";
        default = {
          enable = false;
        };
      };
    };
  };

in
{
  options.colorSchemes = mkOption {
    type = listOf (either colorScheme str);
    description = "List of colorschemes";
  };

  config =
    with config.lib.colorScheme;
    let
      colorSchemes = config.colorSchemes |> map convertColorScheme;
    in
    {
      stylix = {
        enable = true;
        inherit (builtins.filter (c: c.isDefault) colorSchemes |> builtins.head |> buildColorScheme)
          base16Scheme
          polarity
          ;
      };
      specialisation =
        builtins.filter (c: !c.isDefault) colorSchemes |> map buildSpecialisation |> builtins.listToAttrs;
    };
}
