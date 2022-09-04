#!/bin/bash

yay -Sy hid-nintendo-dkms
#Needed for single Joycons to show up in steam:
yay -Sy nintendo-udev
yay -Sy joycond-git
#Needed for joycon gyro support in UDP input applications:
yay -Sy joycond-cemuhook-git
sudo modprobe hid-nintendo
sudo systemctl enable --now joycond
