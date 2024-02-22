#!/bin/sh
echo "Setting up Environment"
prevdir=$(readlink -f $(pwd))
scriptdir=$(dirname $(readlink -f $0))
repo=$(dirname $scriptdir)
packages=$repodir/common/packages
configs=$repodir/common/configs
snippets=$repodir/common/configs
cd $scriptdir
