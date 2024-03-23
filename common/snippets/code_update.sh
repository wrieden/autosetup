#!/bin/sh
source $(dirname $0)/env_setup.sh
echo "Updating code"
[[ $(command -v code) ]] || { echo "code not found"; exit 1; }
code --update-extensions

required_pkg=$(cat $packages/code.txt | grep -v '^$')
installed_pkg=$(code --list-extensions | grep -v '^$')
all_pkg=$(echo -e "$required_pkg\n$installed_pkg" | sort -u)
filtered_pkg=$(echo "$all_pkg" | grep -vE "^($(cat $packages/code-ignore.txt | tr '\n' '|'))$")
missing_pkg=$(echo -e "$installed_pkg\n$installed_pkg\n$filtered_pkg" | sort | uniq -u)

echo "$filtered_pkg" > $packages/code.txt
echo "$missing_pkg" | xargs -rn1 code --install-extension

#echo """$(echo "$installed_pkg" | sort -u < $packages/code.txt | grep -vE "^($(cat $packages/code-ignore.txt | tr "\n" "|"))$")""" > $packages/code.txt
#echo $(echo $installed_pkg | sort < $packages/code.txt | uniq -u | grep -v '^$') | xargs -rn1 code --install-extension

