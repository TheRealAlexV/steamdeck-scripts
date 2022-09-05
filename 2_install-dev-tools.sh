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
sudo pacman --noconfirm -S --overwrite \* base-devel
sudo pacman --noconfirm -Syu fakeroot glibc linux-api-headers libdrm libappindicator-gtk3 cmake gcc
sudo pacman --noconfirm -Syu holo/linux-headers linux-neptune-headers holo/linux-lts-headers 
sudo pacman -Qknq | cut -d' ' -f 1 | sudo pacman --noconfirm -S --overwrite '*' -
sudo steamos-readonly enable