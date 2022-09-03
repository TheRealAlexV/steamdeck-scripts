#!/bin/bash

sudo steamos-readonly disable

sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -S bc
