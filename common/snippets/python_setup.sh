#!/bin/sh
echo "Setting up python"
yay -S --noconfirm --needed python python-pip
rm -rf ~/.python-venv
python -m venv ~/.python-venv
source ~/.python-venv/bin/activate
pip install --upgrade --upgrade-strategy eager wheel
source $snippets/python_update.sh
