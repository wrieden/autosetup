#!/bin/sh
echo "Setting up pyocd"
pip install pyocd
echo "$(pyocd pack show --no-header | sed -En 's/\s*(\S+).*/\1/p' | sort -u < $packages/pyocd.txt)" > $packages/pyocd.txt
pyocd pack install $(cat $packages/pyocd.txt)
git clone https://github.com/pyocd/pyOCD.git
sudo cp pyOCD/udev/*.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
rm -rf pyOCD

