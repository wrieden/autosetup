#!/bin/zsh

[[ $(command -v paclog) ]] || (echo "Missing paclog! exiting"; exit)
[[ $(command -v pip-chill) ]] || (echo "Missing pip-chill! exiting"; exit)

setupdir=$(dirname $0)

git -C $setupdir commit -a -m "pre update"
git -C $setupdir pull --rebase

cp -v ~/.ssh/config $setupdir/sshconfig
cp -v ~/.gitconfig $setupdir/
cp -v ~/.gitconfig-trinamic $setupdir/
cp -v ~/.zshrc $setupdir/
cp -v ~/.p10k.zsh $setupdir/
echo "$(yay -Qqe)\n$(paclog -f in | sed -En 's/.*installed\s+(\S+).*/\1/p' | sed -n '/paclog/,$p')" | sort | uniq -d | sort -u < $setupdir/packages.txt > $setupdir/packages.txt
pip-chill --no-version | sort -u < $setupdir/pip-packages.txt > $setupdir/pip-packages.txt
code --list-extensions | sort -u < $setupdir/code-packages.txt > $setupdir/code-packages.txt

git -C $setupdir commit -a -m "updated"
git -C $setupdir push
