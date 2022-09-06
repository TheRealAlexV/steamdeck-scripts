#!/bin/bash

ps aux | grep 'bin/code-server' | grep -v 'grep bin/' > /dev/null
VSCODE=$?
echo "$VSCODE"

who | grep 'pts/' > /dev/null
SSH=$?
echo "$SSH"

if [ $SSH == "0" ] || [ $VSCODE == "0" ]; then
  exit 1
else
  exit 0
fi