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

sudo cp $SCRIPTSDIRCFG/1_post-update-init/config.py /usr/lib/python3.10/site-packages/lutris/util/steam/
sudo python -m compileall /usr/lib/python3.10/site-packages/lutris/util/steam/

sudo steamos-readonly enable