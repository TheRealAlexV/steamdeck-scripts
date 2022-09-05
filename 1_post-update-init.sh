#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

PACKAGES="krfb screen htop wget git ncdu yay-git mlocate"

## deletes files that are automatically recreated but will break reinstall
sudo rm /etc/ctdb/ctdb-crash-cleanup.sh 
sudo rm /etc/ctdb/debug-hung-script.sh 
sudo rm /etc/ctdb/debug_locks.sh 
sudo rm /etc/ctdb/events/notification/README 
sudo rm /etc/ctdb/functions 
sudo rm /etc/ctdb/nfs-checks.d/00.portmapper.check 
sudo rm /etc/ctdb/nfs-checks.d/10.status.check 
sudo rm /etc/ctdb/nfs-checks.d/20.nfs.check 
sudo rm /etc/ctdb/nfs-checks.d/30.nlockmgr.check 
sudo rm /etc/ctdb/nfs-checks.d/40.mountd.check 
sudo rm /etc/ctdb/nfs-checks.d/50.rquotad.check 
sudo rm /etc/ctdb/nfs-checks.d/README 
sudo rm /etc/ctdb/nfs-linux-kernel-callout 
sudo rm /etc/ctdb/notify.sh 
sudo rm /etc/ctdb/statd-callout 
sudo rm /etc/sudoers.d/ctdb 
sudo rm /etc/ctdb/ctdb-crash-cleanup.sh 
sudo rm /etc/ctdb/debug-hung-script.sh 
sudo rm /etc/ctdb/debug_locks.sh 
sudo rm /etc/ctdb/events/notification/README 
sudo rm /etc/ctdb/functions 
sudo rm /etc/ctdb/nfs-checks.d/00.portmapper.check 
sudo rm /etc/ctdb/nfs-checks.d/10.status.check 
sudo rm /etc/ctdb/nfs-checks.d/20.nfs.check 
sudo rm /etc/ctdb/nfs-checks.d/30.nlockmgr.check 
sudo rm /etc/ctdb/nfs-checks.d/40.mountd.check 
sudo rm /etc/ctdb/nfs-checks.d/50.rquotad.check 
sudo rm /etc/ctdb/nfs-checks.d/README 
sudo rm /etc/ctdb/nfs-linux-kernel-callout 
sudo rm /etc/ctdb/notify.sh 
sudo rm /etc/ctdb/statd-callout 
sudo rm /etc/sudoers.d/ctdb 
sudo rm /etc/ctdb/functions 
sudo rm /etc/X11/tigervnc/Xsession 
sudo rm /etc/ld.so.conf.d/fakeroot.conf
sudo rm -r /etc/ufw

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --populate holo
yes | sudo pacman -Syuu
yes | sudo pacman -Syu --needed $PACKAGES
yes | sudo pacman -Scc

## fixes problem with flatpak version of lutris
sudo cp config.py /usr/lib/python3.10/site-packages/lutris/util/steam/
sudo python -m compileall /usr/lib/python3.10/site-packages/lutris/util/steam/

sudo steamos-readonly enable