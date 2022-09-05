#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" hid-nintendo-dkms
#Needed for single Joycons to show up in steam:
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" nintendo-udev
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" joycond-git
#Needed for joycon gyro support in UDP input applications:
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" joycond-cemuhook-git
sudo modprobe hid-nintendo
sudo systemctl enable --now joycond
sudo steamos-readonly enable