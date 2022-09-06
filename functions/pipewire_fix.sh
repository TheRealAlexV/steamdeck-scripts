#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
 
sudo systemctl enable "$INCLUDES/pipewire_fix/sleep-recover-pipewire.service"

sudo steamos-readonly enable