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

cp -rv ./dots/* /home/vespr/.config/
cp -rv ./dots/vscode/settings.json /home/vespr/.config/Code/User/
cp -rv ./dots/fish /root/.config/
cp -rv ./* /etc/nixos/

echo ""
nixos-rebuild switch
echo ""
date
echo "Done | Remember to read the messages"
echo ""