#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
echo "Setting up firewall"
sudo pacman -S ufw --noconfirm
yes | sudo ufw reset
sudo ufw default disable
sudo ufw allow 22
sudo ufw allow 5900
yes | sudo ufw enable
sudo steamos-readonly enable