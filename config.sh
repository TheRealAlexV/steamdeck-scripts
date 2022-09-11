#!/bin/bash

# Open Firewall Ports Configuration:
declare -A PORTS
PORTS["5900"]=tcp  # For VNC, see the 'krfb' application in the start menu.
PORTS["22"]=tcp  # For SSH

# File Path Configurations:
# If you change any of the following paths, especially LOCALDIR and SCRIPTDIRCFG,
# Make sure to update the paths in includes/sshd/ssh-inhibit-sleep.service to match.
DECKHOME="/home/deck"
LOCALDIR="$DECKHOME/.local"
SCRIPTSDIRCFG="$LOCALDIR/trav-steamdeck-scripts"
FUNCTIONS="$SCRIPTSDIRCFG/functions"
INCLUDES="$SCRIPTSDIRCFG/includes"
LOCALBINS="$LOCALDIR/bin"
SCRIPTSHOME="$DECKHOME/.trav-steamdeck-scripts"
SCRIPTCACHE="${DECKHOME}/${SCRIPTSHOME}/.cache"

# Making Directories
mkdir -p "$SCRIPTSHOME"
mkdir -p "$LOCALBINS"

# Adding to Path:

grep -qxF 'export PATH="$PATH:$HOME/.local/trav-steamdeck-scripts"' $DECKHOME/.bashrc || echo 'export PATH="$PATH:$HOME/.local/trav-steamdeck-scripts"' >> $DECKHOME/.bashrc
grep -qxF 'export PATH="$PATH:$HOME/.local/bin"' $DECKHOME/.bashrc || echo 'export PATH="$PATH:$HOME/.local/bin"' >> $DECKHOME/.bashrc

