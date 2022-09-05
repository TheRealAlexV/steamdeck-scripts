#!/bin/bash
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPTDIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
. $SCRIPTDIR/config.sh

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