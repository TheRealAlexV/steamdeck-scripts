#!/bin/bash
if [ ! -f "~/.local/bin/compsize"  ] ||  [ ! -f "~/.local/bin/duperemove" ] ||  [ ! -f "~/.local/bin/rmlint" ]
then
	mkdir -p ~/.local/.script-cache
  sudo pacman --cachedir ~/.local/.script-cache/ -Sw compsize duperemove rmlint
  for f in ~/.local/.script-cache/*.pkg.tar.zst ; do tar -xf "$f" -C ~/.local/bin --strip-components=2 usr/bin ; done
  rm -rf ~/.local/.script-cache
fi
cd /tmp || exit
sudo rmlint --types="duplicates" --config=sh:handler=clone /home
sudo ./rmlint.sh -d -p -r -k
sudo rm -r rmlint*
