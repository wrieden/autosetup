#!/bin/sh
echo "Setting up git and ssh"
yay -S --noconfirm --needed git
mkdir -p ~/.ssh
ln -sf $configs/sshconfig ~/.ssh/config
ln -sf $configs/.gitconfig ~/.gitconfig
ln -sf $configs/.gitconfig-trinamic ~/.gitconfig-trinamic
