import json
import argparse
import subprocess

base16_map = {
    "base00": "surface_container",
    "base01": "surface_container_high",
    "base02": "surface_container_highest",
    "base03": "outline",
    "base04": "on_surface_variant",
    "base05": "on_background",
    "base06": "on_error_container",
    "base07": "on_tertiary_container",
    "base08": "error",
    "base09": "on_secondary_container",
    "base0A": "on_primary_container",
    "base0B": "primary",
    "base0C": "secondary",
    "base0D": "surface_tint",
    "base0E": "tertiary",
    "base0F": "tertiary_fixed_dim",
}

parser = argparse.ArgumentParser(
    description="Create base16 yaml file from matugen output"
)
parser.add_argument("image", help="The image to generate the colors from")
parser.add_argument("--name", "-n", help="The name of the colorscheme")
parser.add_argument("--polarity", "-p", help="Dark or light", default="dark")
parser.add_argument(
    "--type", "-t", help="The type of the colorscheme", default="scheme-tonal-spot"
)
parser.add_argument("--output", "-o", help="The output file", default="base16.yaml")
args = parser.parse_args()
image = args.image
name = args.name
polarity = args.polarity
scheme_type = args.type
output = args.output

matugen_output = subprocess.run(
    [
        "matugen",
        "image",
        image,
        "--dry-run",
        "--type",
        scheme_type,
        "--json",
        "hex",
    ],
    capture_output=True,
    text=True,
).stdout

colors = json.loads(matugen_output)["colors"][polarity]

base16_colors = {
    name: f'"{colors[hex].strip("'")}"' for name, hex in base16_map.items()
}

yaml_content = f"""system: "base16"
name: "{name}"
author: "matugen"
variant: "{polarity}"
palette:
""" + "\n".join([f"  {k}: {v}" for k, v in base16_colors.items()])

with open(output, "w") as f:
    f.write(yaml_content)
