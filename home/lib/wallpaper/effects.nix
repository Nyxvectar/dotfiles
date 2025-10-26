{ pkgs, config, ... }:
{
  lib.wallpapers.effects = {
    hydrogen =
      {
        name,
        path,
        cropAspectRatio ? with config.lib.monitors.mainMonitor.mode; "${toString width}x${toString height}",
        extraArguments ? "",
      }:
      pkgs.runCommand name { buildInputs = [ pkgs.imagemagick ]; } ''
        ${pkgs.python3}/bin/python ${./hydrogen.py} -i ${path} --aspect-ratio-crop ${cropAspectRatio} -o $out ${extraArguments}
      '';
    vignette =
      {
        name,
        path,
        extraArguments ? "-d 100 -o 20",
      }:
      let
        # Fred's ImageMagick script
        fredVignette = pkgs.stdenv.mkDerivation {
          name = "vignette";
          src = pkgs.fetchurl {
            url = "http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname=vignette3&dirname=vignette3";
            sha256 = "XlisDt8FTK20UY3R+nqaTP96rHM3fE20wKM1sT6udrM=";
          };
          nativeBuildInputs = [ pkgs.bash ];
          dontUnpack = true;
          installPhase = ''
            install -Dm755 $src $out/bin/vignette
          '';
        };
      in
      pkgs.runCommand name
        {
          buildInputs = [ pkgs.imagemagick ];
        }
        ''
          ${fredVignette}/bin/vignette ${extraArguments} ${path} $out
        '';
  };
}
