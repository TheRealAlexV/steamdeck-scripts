#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
sudo killall -9 krfb
sudo pacman --noconfirm -Rns krfb
sudo pacman --noconfirm -S --overwrite \* krfb

sudo steamos-readonly enable