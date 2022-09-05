#!/bin/bash
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPTDIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
. $SCRIPTDIR/config.sh

sudo echo "sudoed"
sudo steamos-readonly disable
sudo pacman --noconfirm -Syu udev libevdev
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" hid-nintendo-dkms
#Needed for single Joycons to show up in steam:
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" nintendo-udev
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" joycond-git
#Needed for joycon gyro support in UDP input applications:
echo y | LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" joycond-cemuhook-git
sudo modprobe hid-nintendo
sudo systemctl enable --now joycond
sudo steamos-readonly enable