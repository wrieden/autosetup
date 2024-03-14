#!/bin/sh
echo "Updating code"
[[ $(command -v code) ]] || { echo "code not found" && exit 1 }
echo "$(code --list-extensions | sort -u < $packages/code.txt | grep -v '^$')" > $packages/code.txt
echo $(code --list-extensions | sort < $packages/code.txt | uniq -u) | xargs -rn1 code --install-extension
