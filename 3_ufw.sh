#!/bin/bash
sudo echo "sudoed"
echo "Setting up firewall"
sudo pacman -S ufw --noconfirm
yes | sudo ufw reset
sudo ufw default disable
sudo ufw allow 22
yes | sudo ufw enable
