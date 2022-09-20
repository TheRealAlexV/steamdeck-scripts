#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

PACKAGES="krfb screen htop wget git ncdu yay-git colord colord-kde"

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
yes | sudo pacman -S --needed $PACKAGES
yes | sudo pacman -Scc

sudo steamos-readonly enable