#!/bin/bash
sudo echo "sudoed"
sudo pacman --noconfirm -S --overwrite \* base-devel
sudo pacman --noconfirm -Syu glibc linux-api-headers udev libdrm libevdev
sudo pacman --noconfirm -Syu screen htop wget git ncdu podman fakeroot yay-git mlocate cmake gcc 
sudo pacman --noconfirm -Syu holo/linux-headers linux-neptune-headers holo/linux-lts-headers $(pacman -Qk 2>/dev/null | grep -ve ' 0 missing' | grep -ie ^libc -e glibc -e gcc -e clang -e headers -e udev -e systemd | awk -F ':' '{print $1}') --overwrite '*'
sudo pacman --noconfirm -Suyy
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman --noconfirm -S --overwrite '*' -
