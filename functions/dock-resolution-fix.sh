#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

sudo sed -i 's/-w 1280 -h 800/-W 1920 -H 1080/g' /usr/bin/gamescope-session

sudo steamos-readonly enable