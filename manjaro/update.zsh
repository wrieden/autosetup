#!/bin/zsh
[[ $(command -v paclog) ]] || { echo "paclog not found"; exit 1 }
[[ $(command -v pyocd) ]] || { echo "pyocd not found"; exit 1 }

source $(dirname $0)/../common/snippets/env_setup.sh

git stash
git pull --rebase
git stash pop

source $snippets/pacman_update.sh
source $snippets/python_update.sh
source $snippets/pyocd_update.sh
source $snippets/code_update.sh
