#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
## setups pacman
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
yes | sudo pacman -Syu

## reinstalls saved packages.txt from backup script
yes | cat $SCRIPTSHOME/packages.txt | sudo yay -Syu --needed -
yes | sudo pacman -Scc

## reinstalls saved flatpaks.txt from backup script
xargs sudo flatpak install -y < $SCRIPTSHOME/flatpaks.txt
yes | sudo pacman -Scc

sudo steamos-readonly enable