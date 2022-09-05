#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

mkdir -p ~/.trav-steamdeck-scripts

touch ~/.trav-steamdeck-scripts/packages.txt
sudo pacman -Qqe | awk '{print $1}' | sudo tee ~/.trav-steamdeck-scripts/packages.txt

touch ~/.trav-steamdeck-scripts/flatpaks.txt
sudo flatpak list --columns=application --app | sudo tee ~/.trav-steamdeck-scripts/flatpaks.txt

sudo steamos-readonly enable