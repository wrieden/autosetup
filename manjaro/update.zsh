#!/bin/zsh


setupdir=$(dirname $0)

git -C $setupdir commit -a -m "pre update"
git -C $setupdir pull --rebase

cp -v ~/.ssh/config $setupdir/sshconfig
cp -v ~/.gitconfig $setupdir/
cp -v ~/.gitconfig-trinamic $setupdir/
cp -v ~/.zshrc $setupdir/
cp -v ~/.p10k.zsh $setupdir/
echo """$(echo "$(yay -Qqe)\n$(paclog -f in | sed -En 's/.*installed\s+(\S+).*/\1/p' | sed -n '/paclog/,$p')" | sort | uniq -d | sort -u < $setupdir/packages.txt)""" > $setupdir/packages.txt
echo "$(pip-chill --no-version | sort -u < $setupdir/pip-packages.txt)" > $setupdir/pip-packages.txt
echo "$(code --list-extensions | sort -u < $setupdir/code-packages.txt)" > $setupdir/code-packages.txt
echo "$(pyocd pack show --no-header | sed -En 's/\s*(\S+).*/\1/p' | sort -u < $setupdir/pyocd-packages.txt)" > $setupdir/pyocd-packages.txt

git -C $setupdir commit -a -m "updated"
git -C $setupdir push


yay -S --noconfirm --needed $(cat $setupdir/packages.txt)
pip install $(cat $setupdir/pip-packages.txt)
pyocd pack install $(cat $setupdir/pip-packages.txt)
echo $(cat $setupdir/code-packages.txt) | xargs -rn1 code --install-extension
