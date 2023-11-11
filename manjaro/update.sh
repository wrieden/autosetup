#!/bin/sh

setupdir=$(dirname $0)

cp -v ~/.zshrc $setupdir/
cp -v ~/.p10k.zsh $setupdir/
pip-chill --no-version > $setupdir/pip-packages.txt
