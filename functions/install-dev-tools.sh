#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
sudo pacman --noconfirm -S --overwrite \* base-devel
sudo pacman --noconfirm -Syu fakeroot glibc linux-api-headers libdrm libappindicator-gtk3 cmake gcc
sudo pacman --noconfirm -Syu holo/linux-headers linux-neptune-headers holo/linux-lts-headers 
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman --noconfirm -S --overwrite '*' -
sudo steamos-readonly enable