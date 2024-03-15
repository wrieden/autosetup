#!/bin/sh
echo "Setting up system..."
[[ -v $env_setup_done ]] || source $(dirname $0)/env_setup.sh

rm -rf ~/.config/systemd/user
mkdir -p ~/.config/systemd
ln -sf $services/systemd-user ~/.config/systemd/user

sudo rm -rf /etc/udev/rules.d
sudo ln -sf $services/udev-rules /etc/udev/rules.d
sudo udevadm control --reload-rules
sudo udevadm trigger

gsettings set org.gnome.desktop.interface monospace-font-name "MesloLGS NF Regular 12"
