cp -r ./* /etc/nixos/
cd /etc/nixos/
nixos-rebuild switch --upgrade --flake .