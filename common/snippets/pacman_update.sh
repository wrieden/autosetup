#!/bin/sh
echo "\n\nUpdating python"

[[ $(command -v yay) ]] || { echo "yay not found" && exit 1 }

yay -Syu --noconfirm
installed_pkg=$(echo "$(yay -Qqe)\n$(paclog -f in | sed -En 's/.*installed\s+(\S+).*/\1/p' | sed -n '/paclog/,$p')" | sort | uniq -d)
echo "$(echo $installed_pkg | sort -u < $packages/pacman.txt | grep -v '^$')" > $packages/pacman.txt
yay -S --noconfirm --needed $(echo $installed_pkg | sort < $packages/pacman.txt | uniq -u)

