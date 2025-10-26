{
  pkgs,
  config,
  ...
}:
{
  lib.wallpapers.lutgen =
    image:
    let
      inherit (image) name path live;
      colors = builtins.concatStringsSep " " config.lib.stylix.colors.toList;
    in
    if live then
      pkgs.runCommand "${name}.gif" { } ''
        ${pkgs.lutgen}/bin/lutgen generate -o palette.png -- ${colors}
        ${pkgs.ffmpeg}/bin/ffmpeg -i ${path} -i palette.png -filter_complex '[0][1] haldclut' $out
      ''
    else
      pkgs.runCommand "${name}.jpg" { } ''
        ${pkgs.lutgen}/bin/lutgen apply -o $out ${path} -- ${colors}
      '';
}
