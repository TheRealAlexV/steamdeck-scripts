#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo

sudo pacman --noconfirm -Sy krfb screen htop wget git ncdu yay-git mlocate
sudo ufw allow 5900
sudo steamos-readonly enable