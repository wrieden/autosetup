#!/bin/sh
echo "Setting up vs code"
yay -S --noconfirm --needed code code-marketplace
ln -sf $configs/code-settings.json ~/.config/Code\ -\ OSS/User/settings.json
ln -sf $configs/code-flags.conf ~/.config/code-flags.conf
echo $(cat $packages/code.txt) | xargs -rn1 code --install-extension
