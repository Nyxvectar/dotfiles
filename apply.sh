#!/bin/bash

if [ "$EUID" -eq 0 ]; then
	echo ""
else
	echo "Are You Root?"
	exit
fi

mkdir -p /root/.config/
mkdir -p /home/vespr/.config/
mkdir -p /home/vespr/.config/Code/User/
mkdir -p /home/vespr/.local/share/fcitx5/

cp -rv ./dots/* /home/vespr/.config/
cp -rv ./dots/themes/ /home/vespr/.local/share/fcitx5/
cp -rv ./dots/vscode/settings.json /home/vespr/.config/Code/User/
cp -rv ./dots/fish /root/.config/
cp -rv ./* /etc/nixos/

echo ""
nixos-rebuild switch --upgrade
echo ""
echo -e "\e[32m$(date)"
echo -e "Done  |  Remember to read the messages\e[0m"
echo ""
