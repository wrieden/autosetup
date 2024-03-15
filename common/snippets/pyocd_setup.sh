#!/bin/sh
echo "Setting up pyocd"
pip install pyocd
git clone https://github.com/pyocd/pyOCD.git
sudo cp pyOCD/udev/*.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
rm -rf pyOCD
source $snippets/pyocd_update.sh

