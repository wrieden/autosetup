#!/bin/zsh

[[ $(command -v paclog) ]] || exit 1
[[ $(command -v pyocd) ]] || exit 1

olddir=$(pwd)
setupdir=$(dirname $0)
cd $setupdir
common=$(dirname $(pwd))/common/

#git -C $setupdir commit -a -m "pre update"
git stash
git pull --rebase

cp -v ~/.ssh/config $common/sshconfig
cp -v ~/.gitconfig $common/
cp -v ~/.gitconfig-trinamic $common/
cp -v ~/.zshrc $common/
cp -v ~/.p10k.zsh $common/

echo """$(echo "$(yay -Qqe)\n$(paclog -f in | sed -En 's/.*installed\s+(\S+).*/\1/p' | sed -n '/paclog/,$p')" | sort | uniq -d | sort -u < pacman-packages.txt)""" > pacman-packages.txt
echo "$(pip list --not-required --exclude-editable --format freeze | sed -En 's/(\S+)==.*/\1/p' | sort -u < $common/pip-packages.txt)" > $common/pip-packages.txt
echo "$(code --list-extensions | sort -u < $common/code-packages.txt)" > $common/code-packages.txt
echo "$(pyocd pack show --no-header | sed -En 's/\s*(\S+).*/\1/p' | sort -u < $common/pyocd-packages.txt)" > $common/pyocd-packages.txt
echo "$(flatpak list --app --columns application | sort -u < $common/flatpak-packages.txt)" > $common/flatpak-packages.txt

git stash pop

yay -S --noconfirm --needed $(cat pacman-packages.txt)
pip install $(cat $common/pip-packages.txt)
pyocd pack install $(cat $common/pyocd-packages.txt)
echo $(cat $common/code-packages.txt) | xargs -rn1 code --install-extension
flatpak install $(cat $common/flatpak-packages.txt)

cd $olddir
