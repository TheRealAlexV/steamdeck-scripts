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
if [ ! -f "/home/deck/.local/bin/compsize"  ] ||  [ ! -f "/home/deck/.local/bin/duperemove" ] ||  [ ! -f "/home/deck/.local/bin/rmlint" ]
then
	mkdir -p $SCRIPTCACHE
  sudo pacman --noconfirm --cachedir $SCRIPTCACHE/ -Sw compsize duperemove rmlint
  for f in $SCRIPTCACHE/*.pkg.tar.zst ; do tar -xf "$f" -C $LOCALBINS --strip-components=2 usr/bin ; done
  rm -rf $SCRIPTCACHE
fi
cd /tmp || exit
sudo rmlint --types="duplicates" --config=sh:handler=clone /home
sudo ./rmlint.sh -d -p -r -k
sudo rm -r rmlint*
sudo steamos-readonly enable