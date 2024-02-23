#!/bin/sh
echo "Updating python"
yay -S --noconfirm --needed python python-pip
source ~/.python-venv/bin/activate
pip install --upgrade pip
echo "$(pip list --not-required --exclude-editable --format freeze | sed -En 's/(\S+)==.*/\1/p' | sort -u < $packages/pip.txt)" > $packages/pip.txt
pip install $(cat $packages/pip.txt)
