#!/bin/sh
echo "\n\nUpdating pyocd"
[[ $(command -v pyocd) ]] || { echo "pyocd not found" && exit 1 }
#pip install --upgrade --upgrade-strategy eager pyocd
installed_pkg=$(pyocd pack show --no-header | sed -En 's/\s*(\S+).*/\1/p')
echo "$(echo $installed_pkg | sort -u < $packages/pyocd.txt)" > $packages/pyocd.txt
pyocd pack install $(echo $installed_pkg | sort < $packages/pyocd.txt | uniq -u)
