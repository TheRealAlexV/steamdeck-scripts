#!/bin/bash

sudo pacman -S --overwrite \* base-devel
sudo pacman -S linux-neptune-headers
sudo pacman -S glibc linux-api-headers udev libdrm libevdev
sudo pacman -Suyy
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman -S -
