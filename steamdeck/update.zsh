#!/bin/zsh
scriptdir=$(dirname $(readlink -f $0))
source $(dirname $0)/../common/snippets/env_setup.sh
[[ $(command -v paclog) ]] || exit 1
[[ $(command -v pyocd) ]] || exit 1
git stash
git pull --rebase
git stash pop

yay -Syyu
source $snippets/flatpak_setup.sh
source $snippets/python_update.sh
source $snippets/pyocd_setup.sh
source $snippets/code_setup.sh
source $snippets/fstab_sdcard_update.sh

echo """$(echo "$(yay -Qqe)\n$(paclog -f in | sed -En 's/.*installed\s+(\S+).*/\1/p' | sed -n '/paclog/,$p')" | sort | uniq -d | sort -u < pacman-packages.txt)""" > pacman-packages.txt
yay -S --noconfirm --needed $(cat pacman-packages.txt)

cd $prevdir
