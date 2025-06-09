#!/bin/bash

if [ "$EUID" -eq 0 ]; then
	echo ""
else
	echo "Have You Root?"
	exit
fi

mkdir -p /root/.config/
mkdir -p /home/vespr/.config/
mkdir -p /home/vespr/.config/Code/User/
cp -rv ./dots/alacritty /home/vespr/.config/
cp -rv ./dots/fish /root/.config/
cp -rv ./dots/fish /home/vespr/.config/
cp -rv ./dots/hypr /home/vespr/.config/
cp -rv ./dots/mako /home/vespr/.config/
cp -rv ./dots/rofi /home/vespr/.config/
cp -rv ./dots/waybar /home/vespr/.config/
cp -rv ./dots/vscode/settings.json /home/vespr/.config/Code/User/
cp -rv ./* /etc/nixos/
echo ""
nixos-rebuild switch
echo ""
date
echo "Done | Remember to read the messages"
echo ""