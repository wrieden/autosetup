#!/bin/sh
echo "Setting up python"
yay -S --noconfirm --needed python python-pip

overwrite='y'
if [[ -e ~/.python-venv ]]; then
  echo "venv already present, overwrite? (y/n)"
  read overwrite
fi

if [[ "$overwrite" == "y" ]]; then
  rm -rf ~/.python-venv
  python -m venv ~/.python-venv
fi

source ~/.python-venv/bin/activate
pip install --upgrade --upgrade-strategy eager wheel
source $snippets/python_update.sh

