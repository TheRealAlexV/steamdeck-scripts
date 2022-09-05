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
if [ ! -f "/var/lib/overlays/etc/upper/default/steamos-btrfs"  ]
then
  read -n 1 -s -r -p "You don't have gitlab.com/popsulfr/steamos-btrfs/ installed. Press any key to install, or press CTRL+Z to abort."
  cd $HOME
  mkdir steamos-btrfs
  curl -sSL https://gitlab.com/popsulfr/steamos-btrfs/-/archive/main/steamos-btrfs-main.tar.gz | tar -xzf - -C steamos-btrfs --strip-components=1
  sudo NONINTERACTIVE=1 ./steamos-btrfs/install.sh
  sudo reboot
fi

echo " Select the operation ************"
echo "  1) De-duplicate"
echo "  2) Balance and Defrag /home steamapps"
echo "  3) Balance and Defrag sdcard steamapps"
echo "  Q) Quit" 
read n

case $n in
        1)
            echo "Removing Dupes"
            if [ ! -f "$LOCALBINS/compsize"  ] ||  [ ! -f "$LOCALBINS/duperemove" ] ||  [ ! -f "$LOCALBINS/rmlint" ]
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
            ;;
        2)
            echo "Balance and Defrag /home steamapps"
            sudo btrfs filesystem defrag -czstd -v -r -f /home/deck/.local/share/Steam/steamapps
            sudo btrfs balance start -m -v /home/deck/.local/share/Steam/steamapps
            ;;
        3)
            echo "Balance and Defrag sdcard steamapps"
            sudo btrfs filesystem defrag -czstd -v -r -f /run/media/mmcblk0p1/steamapps
            sudo btrfs balance start -m -v /run/media/mmcblk0p1/steamapps
            ;;
        *)
            ;;
esac

sudo steamos-readonly enable