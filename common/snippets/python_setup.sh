#!/bin/sh
echo "Setting up python"
yay -S --noconfirm --needed python python-pip
rm -rf ~/.python-venv
python -m venv ~/.python-venv
source ~/.python-venv/bin/activate
source $snippets/python_update.sh
