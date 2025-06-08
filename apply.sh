#!/bin/bash

sudo cp -rv ./* /etc/nixos/
sudo nixos-rebuild switch
