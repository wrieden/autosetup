#!/bin/sh
echo "\n\nUpdating pyocd"
[[ $(command -v pyocd) ]] || { echo "pyocd not found" && exit 1; }
#pip install --upgrade --upgrade-strategy eager pyocd
installed_pkg=$(pyocd pack show --no-header | sed -En 's/\s*\w*\.(\w+)_.*/\1/p' | tr "x" "?")
echo "$(echo $installed_pkg | sort -u < $packages/pyocd.txt | grep -v '^$')" > $packages/pyocd.txt
pyocd pack install --update -v $(echo $installed_pkg | sort < $packages/pyocd.txt | uniq -u)