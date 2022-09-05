#!/bin/bash
DECKHOME="/home/deck"
LOCALDIR="$DECKHOME/.local"
SCRIPTSDIRCFG="$LOCALDIR/trav-steamdeck-scripts"
FUNCTIONS="$SCRIPTSDIRCFG/functions"
INCLUDES="$SCRIPTSDIRCFG/includes"
LOCALBINS="$LOCALDIR/bin"
SCRIPTSHOME="$DECKHOME/.trav-steamdeck-scripts"
SCRIPTCACHE="${DECKHOME}/${SCRIPTSHOME}/.cache"
mkdir -p "$SCRIPTSHOME"
mkdir -p "$LOCALBINS"
grep -qxF 'export PATH="$PATH:$HOME/.local/trav-steamdeck-scripts"' $DECKHOME/.bashrc || echo 'export PATH="$PATH:$HOME/.local/trav-steamdeck-scripts"' >> $DECKHOME/.bashrc
grep -qxF 'export PATH="$PATH:$HOME/.local/bin"' $DECKHOME/.bashrc || echo 'export PATH="$PATH:$HOME/.local/bin"' >> $DECKHOME/.bashrc

