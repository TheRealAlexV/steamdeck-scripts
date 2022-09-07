#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable
 
sudo systemctl enable "$INCLUDES/sshd/ssh-inhibit-sleep.service"

sudo steamos-readonly enable