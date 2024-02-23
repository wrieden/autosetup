#!/bin/sh
echo "Setting up Environment"
prevdir=$(readlink -f $(pwd))
repo=$(dirname $scriptdir)
echo "Working Directory: $scriptdir"
echo "Repository Directory: $repo"
packages=$repo/common/packages
configs=$repo/common/configs
snippets=$repo/common/snippets
cd $scriptdir
