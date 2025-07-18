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

cp -rv ./home/* /home/${userName}/.config/
cp -rv ./home/themes/ /home/${userName}/.local/share/fcitx5/
cp -rv ./annex/vscode/settings.json /home/${userName}/.config/Code/User/
cp -rv ./home/fish /root/.config/
cp -rv ./* /etc/nixos/

nixos-rebuild switch --upgrade

echo -e "\n\e[32m$(date)"
echo -e "Done  |  Remember to read the messages\e[0m"