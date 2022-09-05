#!/bin/bash
declare -A PORTS
PORTS["5900"]=tcp
PORTS["22"]=tcp

sudo echo "sudoed"
sudo steamos-readonly disable
echo "Setting up firewall"
sudo pacman -Syu ufw --noconfirm
yes | sudo ufw reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
for P in "${!PORTS[@]}"; do 
  sudo ufw allow "${P}"/"${PORTS[$P]}";
done
yes | sudo ufw enable
sudo steamos-readonly enable