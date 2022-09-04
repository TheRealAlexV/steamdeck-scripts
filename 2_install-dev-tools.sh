#!/bin/bash

sudo pacman -S --overwrite \* base-devel
sudo pacman -Syu glibc linux-api-headers udev libdrm libevdev
sudo pacman -Syu screen htop wget git ncdu podman fakeroot yay-git mlocate cmake gcc 
sudo pacman -Syu holo/linux-headers linux-neptune-headers holo/linux-lts-headers $(pacman -Qk 2>/dev/null | grep -ve ' 0 missing' | grep -ie ^libc -e glibc -e gcc -e clang -e headers -e udev -e systemd | awk -F ':' '{print $1}') --overwrite '*'
sudo pacman -Suyy
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman -S --overwrite '*' -
