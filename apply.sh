#!/bin/bash

if [ "$EUID" -eq 0 ]; then
	echo ""
else
	echo "Have You Root?"
	exit
fi

mkdir -p /root/.config/
mkdir -p ~/.config/
mkdir -p ~/.config/Code/User/
cp -rv ./dots/alacritty ~/.config/
cp -rv ./dots/fish /root/.config/
cp -rv ./dots/fish ~/.config/
cp -rv ./dots/hypr ~/.config/
cp -rv ./dots/mako ~/.config/
cp -rv ./dots/rofi ~/.config/
cp -rv ./dots/waybar ~/.config/
cp -rv ./dots/vscode/settings.json ~/.config/Code/User/
cp -rv ./* /etc/nixos/
echo ""
nixos-rebuild switch
echo ""
date
echo "Done | Remember to read the messages"
echo ""