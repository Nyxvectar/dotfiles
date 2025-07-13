#!/bin/bash
mkdir -p /root/.config/
mkdir -p /home/vespr/.config/
mkdir -p /home/vespr/.config/Code/User/
mkdir -p /home/vespr/.local/share/fcitx5/
cp -rv ./home/* /home/vespr/.config/
cp -rv ./annex/themes/ /home/vespr/.local/share/fcitx5/
cp -rv ./home/vscode/settings.json /home/vespr/.config/Code/User/
cp -rv ./home/fish /root/.config/
cp -rv ./* /etc/nixos/
nixos-rebuild switch --upgrade
echo -e "\e[32m$(date)"
echo -e "Done  |  Remember to read the messages\e[0m"
