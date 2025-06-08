#!/bin/bash

echo ""
sudo cp -rv ./* /etc/nixos/
echo ""
sudo nixos-rebuild switch
echo ""
date
echo "Done | Remember to read the messages"
echo ""