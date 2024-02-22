#!/bin/sh
echo "Setting up Environment"
prevdir=$(readlink -f $(pwd))
scriptdir=$(dirname $(readlink -f $0))
repo=$(dirname $scriptdir)
packages=$repo/common/packages
configs=$repo/common/configs
snippets=$repo/common/snippets
cd $scriptdir
