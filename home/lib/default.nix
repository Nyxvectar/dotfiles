{ config, ... }:
{
  imports = [
    ./colorScheme
    ./wallpaper
    ./swhkd.nix
    ./addFlags.nix
  ];

  config.lib.misc = {
    mkGLSLColor =
      color:
      let
        inherit (config.lib.stylix) colors;
        r = colors."${color}-rgb-r";
        g = colors."${color}-rgb-g";
        b = colors."${color}-rgb-b";
        rf = "${r}.0 / 255.0";
        gf = "${g}.0 / 255.0";
        bf = "${b}.0 / 255.0";
      in
      "vec4(${rf}, ${gf}, ${bf}, 1.0)";
  };
}
