import json
import argparse
import subprocess

parser = argparse.ArgumentParser(
    description="Create base16 yaml file from matugen output"
)
parser.add_argument("image", help="The image to generate the colors from")
parser.add_argument("--name", "-n", help="The name of the colorscheme")
parser.add_argument("--polarity", "-p", help="Dark or light", default="dark")
parser.add_argument("--output", "-o", help="The output file", default="base16.yaml")
args = parser.parse_args()
image = args.image
name = args.name
polarity = args.polarity
output = args.output

hellwal_output = subprocess.run(
    ["hellwal", "-i", image, "--dark" if polarity == "dark" else "--light", "--json"],
    capture_output=True,
    text=True,
).stdout

colors = json.loads(hellwal_output)["colors"]

base16_colors = {
    name: f'"{colors[colorname].strip("'")}"'
    for name, colorname in [
        ("base00", "color0"),
        ("base01", "color1"),
        ("base02", "color2"),
        ("base03", "color3"),
        ("base04", "color4"),
        ("base05", "color5"),
        ("base06", "color6"),
        ("base07", "color7"),
        ("base08", "color8"),
        ("base09", "color9"),
        ("base0A", "color10"),
        ("base0B", "color11"),
        ("base0C", "color12"),
        ("base0D", "color13"),
        ("base0E", "color14"),
        ("base0F", "color15"),
    ]
}

yaml_content = f"""system: "base16"
name: "{name}"
author: "matugen"
variant: "{polarity}"
palette:
""" + "\n".join([f"  {k}: {v}" for k, v in base16_colors.items()])

with open(output, "w") as f:
    f.write(yaml_content)
