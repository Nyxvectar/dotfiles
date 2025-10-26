{ config, pkgs, ... }:
{
  lib.wallpapers.goNord =
    image:
    let
      goNordScript =
        pkgs.writers.writePython3Bin "goNord"
          {
            libraries = with pkgs.python3Packages; [
              image-go-nord
              pyyaml
            ];
            doCheck = false;
          }
          ''
            from ImageGoNord import GoNord
            import argparse
            import yaml

            parser = argparse.ArgumentParser(description="Go nord")
            parser.add_argument(
                "--colorscheme", "-c", help="Path to the yaml file containing the colorscheme"
            )
            parser.add_argument("--image", "-i", help="Path to the image to quantize")
            parser.add_argument(
                "--output", "-o", help="Path to the output image", default="output.png"
            )
            args = parser.parse_args()
            colorscheme = args.colorscheme
            image = args.image
            output = args.output

            go_nord = GoNord()
            go_nord.enable_avg_algorithm()
            go_nord.enable_gaussian_blur()
            image = go_nord.open_image(image)
            if colorscheme:
                go_nord.reset_palette()
                palette = set(yaml.safe_load(open(colorscheme))["palette"].values())
                for color in palette:
                    go_nord.add_color_to_palette(color)
            go_nord.quantize_image(image, save_path=output)
          '';

      inherit (image) name path;
    in
    pkgs.runCommand "${name}.jpg" { } ''
      ${goNordScript}/bin/goNord -c ${config.stylix.base16Scheme} -i ${path} -o $out
    '';
}
