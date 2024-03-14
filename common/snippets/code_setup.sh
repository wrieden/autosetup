#!/bin/sh
echo "Setting up vs code"
yay -S --noconfirm --needed code code-marketplace
mkdir -p "~/.config/Code - OSS/User"
ln -sf $configs/code-settings.json "~/.config/Code - OSS/User/settings.json"
ln -sf $configs/code-flags.conf ~/.config/code-flags.conf
source $snippets/code_update.sh
