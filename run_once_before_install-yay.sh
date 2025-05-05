#!/bin/bash

echo "Installing yay manually."
if yay --version; then
	echo "yay already installed"
	exit 0
fi
sudo pacman -S --needed git base-devel
cd /tmp
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
