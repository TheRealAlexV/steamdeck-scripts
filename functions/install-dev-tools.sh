#!/bin/bash
read -n 1 -s -r -p "You should only install these if you know what you are doing. Its easy to brick your device using this option, especially if you don't have enough space available. Press any key to install, or press CTRL+Z to abort."
sudo echo "sudoed"
sudo steamos-readonly disable
sudo pacman --noconfirm -S --overwrite \* base-devel
sudo pacman --noconfirm -Syu fakeroot glibc linux-api-headers libdrm libappindicator-gtk3 cmake gcc
sudo pacman --noconfirm -Syu holo/linux-headers linux-neptune-headers holo/linux-lts-headers
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman --noconfirm -S --overwrite '*' -
sudo steamos-readonly enable