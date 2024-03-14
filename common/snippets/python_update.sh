#!/bin/sh
echo "\n\nUpdating python"
yay -S --noconfirm --needed python python-pip

source ~/.python-venv/bin/activate
[[ $(command -v pip) ]] || { echo "pip not found" && exit 1 }

pip install --upgrade --upgrade-strategy eager pip
pip install --upgrade --upgrade-strategy eager $(pip list --outdated --not-required --exclude-editable | tail -n+3 | sed -En 's/^\s*(\S+).*$/\1/p')

installed_pkg=$(pip list --not-required --exclude-editable --format freeze | sed -En 's/(\S+)==.*/\1/p')
echo "$(echo $installed_pkg | sort -u < $packages/pip.txt | grep -v '^$')" > $packages/pip.txt
pip install --upgrade --upgrade-strategy eager $(echo $installed_pkg | sort < $packages/pip.txt | uniq -u)
