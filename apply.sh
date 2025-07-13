#!/bin/bash
mkdir -p /root/.config /home/vespr/.config/Code/User /home/vespr/.local/share/fcitx5
cp -r ./home/* /home/vespr/.config/
cp -r ./annex/themes/ /home/vespr/.local/share/fcitx5/ ./home/vscode/settings.json /home/vespr/.config/Code/User/ ./home/fish /root/.config/ ./* /etc/nixos/
nixos-rebuild switch --upgrade
echo -e "\e[32m$(date)\nDone  |  Remember to read the messages\e[0m"