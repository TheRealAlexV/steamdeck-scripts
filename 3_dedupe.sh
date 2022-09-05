#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
if [ ! -f "/home/deck/.local/bin/compsize"  ] ||  [ ! -f "/home/deck/.local/bin/duperemove" ] ||  [ ! -f "/home/deck/.local/bin/rmlint" ]
then
	mkdir -p ~/.local/.script-cache
  sudo pacman --noconfirm --cachedir ~/.local/.script-cache/ -Sw compsize duperemove rmlint
  for f in ~/.local/.script-cache/*.pkg.tar.zst ; do tar -xf "$f" -C ~/.local/bin --strip-components=2 usr/bin ; done
  rm -rf ~/.local/.script-cache
fi
cd /tmp || exit
sudo rmlint --types="duplicates" --config=sh:handler=clone /home
sudo ./rmlint.sh -d -p -r -k
sudo rm -r rmlint*
sudo steamos-readonly enable