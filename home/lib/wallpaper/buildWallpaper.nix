{
  pkgs,
  lib,
  config,
  ...
}:
with builtins;
let
  inherit (config.lib.wallpapers) goNord lutgen;

  getWallpaper =
    wallpaper:
    let
      inherit (wallpaper)
        name
        baseImageName
        path
        convertMethod
        effects
        ;
    in
    {
      inherit
        name
        baseImageName
        convertMethod
        effects
        ;
    }
    // (
      if path == null then
        {
          path = "${pkgs.wallpapers}/${name}";
        }
      else
        { inherit path; }
    );

  applyEffect =
    {
      name,
      path,
    }:
    effectName: effectOptions:
    if config.lib.wallpapers.effects ? ${effectName} then
      config.lib.wallpapers.effects.${effectName} ({ inherit name path; } // effectOptions.options)
    else
      path;
  # if hasAttr effect.name config.lib.wallpapers.effects then
  #   config.lib.wallpapers.effects.${effect.name} { inherit name path; } // effect.passthru
  # else
  #   path;

  applyEffects =
    wallpaper:
    let
      inherit (wallpaper)
        name
        baseImageName
        path
        convertMethod
        effects
        ;
    in
    {
      inherit name baseImageName convertMethod;
    }
    // (
      if effects == null then
        { inherit path; }
      else
        {
          path =
            lib.attrsets.filterAttrs (_: v: v.enable == true) effects
            |> lib.attrsets.foldlAttrs (
              acc: effectName: effectOptions:
              applyEffect {
                inherit name;
                path = acc;
              } effectName effectOptions
            ) path;
        }
    );

  generateWallpaper =
    wallpaper:
    let
      inherit (wallpaper) path convertMethod;
      name = match "(.*)\\..*" wallpaper.name |> head;
      baseImageName = if wallpaper.baseImageName == null then name else wallpaper.baseImageName;
      live = (toString path |> match ".*gif$") != null;
      thisWallpaper = { inherit name path live; };
    in
    {
      inherit name live;
      path =
        if lib.strings.hasPrefix baseImageName config.lib.stylix.colors.scheme then
          path
        else if convertMethod == "gonord" then
          goNord thisWallpaper
        else if convertMethod == "lutgen" then
          lutgen thisWallpaper
        else
          path;
    };

  setWallpaper =
    wallpaper:
    let
      inherit (wallpaper) name live path;
      ext = if live then ".gif" else ".jpg";
    in
    {
      name = "Pictures/Wallpapers/generated/${name}${ext}";
      value = {
        source = path;
      };
    };

  blurWallpaper =
    wallpaper:
    let
      inherit (wallpaper) name path live;
    in
    if live then
      null
    else
      {
        name = "Pictures/Wallpapers/generated/${name}-blurred.jpg";
        value = {
          source = pkgs.runCommand "${name}-blurred.jpg" { } ''
            ${pkgs.imagemagick}/bin/magick ${path} -blur 0x30 $out
          '';
        };
      };
in
{
  lib.wallpapers = {
    inherit
      getWallpaper
      applyEffects
      convertWallpaper
      generateWallpaper
      setWallpaper
      blurWallpaper
      ;
  };
}
