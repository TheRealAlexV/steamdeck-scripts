#!/bin/bash
sudo echo "sudoed"
sudo steamos-readonly disable

sudo cp $INCLUDES/fix_lutris/config.py /usr/lib/python3.10/site-packages/lutris/util/steam/
sudo python -m compileall /usr/lib/python3.10/site-packages/lutris/util/steam/

sudo steamos-readonly enable