#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

touch $SCRIPTSHOME/packages.txt
sudo pacman -Qqe | awk '{print $1}' | sudo tee $SCRIPTSHOME/packages.txt

touch $SCRIPTSHOME/flatpaks.txt
sudo flatpak list --columns=application --app | sudo tee $SCRIPTSHOME/flatpaks.txt

sudo steamos-readonly enable