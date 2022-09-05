#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
sudo pacman --noconfirm -S --overwrite \* base-devel
sudo pacman --noconfirm -Syu fakeroot glibc linux-api-headers udev libdrm libevdev libappindicator-gtk3 cmake gcc
sudo pacman --noconfirm -Syu holo/linux-headers linux-neptune-headers holo/linux-lts-headers 
sudo pacman --noconfirm -Syu $(pacman -Qk 2>/dev/null | grep -ve ' 0 missing' | grep -ie ^libc -e glibc -e gcc -e clang -e headers -e udev -e systemd | awk -F ':' '{print $1}') --overwrite '*'
sudo pacman --noconfirm -Suyy
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman --noconfirm -S --overwrite '*' -
sudo steamos-readonly enable