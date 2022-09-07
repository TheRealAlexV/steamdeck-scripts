#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

sudo usermod -aG wheel deck
echo "%wheel ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/wheel

sudo steamos-readonly enable