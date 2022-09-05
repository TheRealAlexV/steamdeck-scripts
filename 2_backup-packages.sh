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

touch $SCRIPTSHOME/packages.txt
sudo pacman -Qqe | awk '{print $1}' | sudo tee $SCRIPTSHOME/packages.txt

touch $SCRIPTSHOME/flatpaks.txt
sudo flatpak list --columns=application --app | sudo tee $SCRIPTSHOME/flatpaks.txt

sudo steamos-readonly enable