#!/bin/zsh

[[ $(command -v paclog) ]] || exit 1
[[ $(command -v pyocd) ]] || exit 1

olddir=$(pwd)
setupdir=$(dirname $0)
cd $setupdir
common=$(dirname $(pwd))/common/

git stash
git pull --rebase
git stash pop

echo """$(echo "$(yay -Qqe)\n$(paclog -f in | sed -En 's/.*installed\s+(\S+).*/\1/p' | sed -n '/paclog/,$p')" | sort | uniq -d | sort -u < $common/pacman-packages.txt)""" > $common/pacman-packages.txt
echo "$(pip list --not-required --exclude-editable --format freeze | sed -En 's/(\S+)==.*/\1/p' | sort -u < $common/pip-packages.txt)" > $common/pip-packages.txt
echo "$(code --list-extensions | sort -u < $common/code-packages.txt)" > $common/code-packages.txt
echo "$(pyocd pack show --no-header | sed -En 's/\s*(\S+).*/\1/p' | sort -u < $common/pyocd-packages.txt)" > $common/pyocd-packages.txt


yay -S --noconfirm --needed $(cat $common/pacman-packages.txt)
pip install $(cat $common/pip-packages.txt)
pyocd pack install $(cat $common/pyocd-packages.txt)
echo $(cat $common/code-packages.txt) | xargs -rn1 code --install-extension

cd $olddir
