#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
sudo pacman --noconfirm -S udev libevdev fakeroot linux-neptune-headers glibc linux-api-headers
sudo pacman --noconfirm -S --overwrite \* base-devel
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S hid-nintendo-dkms
# Needed for single Joycons to show up in steam:
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S nintendo-udev
echo y | LANG=C yay --removemake --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S joycond-git
# Needed for joycon gyro support in UDP input applications:
echo y | LANG=C yay --removemake --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S joycond-cemuhook-git
sudo modprobe hid-nintendo
sudo systemctl enable --now "$INCLUDES/joycons/joycond.service"
sudo steamos-readonly enable