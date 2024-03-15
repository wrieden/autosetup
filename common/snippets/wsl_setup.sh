#!/bin/sh
echo "Setting up wsl stuff"

sudo groupadd usb
sudo usermod -a -G usb $USER

sudo ln -sf $configs/wsl.conf /etc/wsl.conf
sudo ln -sf $configs/profile-wsl.conf /etc/profile.d/wsl.sh
sudo ln -sf $configs/udev-wsl.conf /etc/udev/rules.d/wsl.sh


systemctl --user enable wsl-symlink-wayland.service     
