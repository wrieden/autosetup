#!/bin/sh

setupdir=$(dirname $0)

cp -v ~/.zshrc $setupdir/
cp -v ~/.p10k.zsh $setupdir/
#expac --timefmt='%F %T' '%l %n %w' | sort -n | sed -En "s/.* .* (.*) explicit/\1/p" | sed -n '/yay/,$p' | sort > $setupdir/packages.txt
yay -Qqe $(paclog -f in | sed -En "s/.*installed\s+(\S+).*/\1/p" | sed -n '/paclog/,$p') | sort > $setupdir/packages.txt
pip-chill --no-version > $setupdir/pip-packages.txt

git -C $setupdir commit -a -m "updated"
git -C $setupdir push
