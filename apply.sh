#!/bin/bash

if [ "$EUID" -eq 0 ]; then
	echo ""
else
	echo "Are You Root?"
	exit
fi

userName="vespr"

mkdir -p /root/.config/
mkdir -p /home/${userName}/.config/
mkdir -p /home/${userName}/.config/Code/User/
mkdir -p /home/${userName}/.local/share/fcitx5/

cp -r ./home/* /home/${userName}/.config/
cp -r ./annex/themes/ /home/${userName}/.local/share/fcitx5/
cp -r ./annex/vscode/settings.json /home/${userName}/.config/Code/User/
cp -r ./home/fish /root/.config/
cp -r ./imports /etc/nixos/
cp -r ./configuration.nix /etc/nixos/
cp -r ./flake.nix /etc/nixos/
cp -r ./home.nix /etc/nixos/

nixos-rebuild switch --upgrade

echo -e "\n\e[32m$(date)"
echo -e "Done  |  Remember to read the messages\e[0m\n"