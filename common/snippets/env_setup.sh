#!/bin/sh
echo "Setting up Environment"
prevdir=$(readlink -f $(pwd))
scriptdir=$(readlink -f $(dirname $0))
repo=$(echo $scriptdir | sed -En 's/(.*\/autosetup).*/\1/p') 
echo "Working Directory: $scriptdir"
echo "Repository Directory: $repo"
packages=$repo/common/packages
configs=$repo/common/configs
snippets=$repo/common/snippets
cd $scriptdir
