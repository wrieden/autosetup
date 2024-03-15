#!/bin/sh
echo "Setting up Environment"

if [[ ! -v $env_setup_done ]]; then
    env_setup_done=1
    prevdir=$(readlink -f $(pwd))
    scriptdir=$(readlink -f $(dirname $0))
    repo=$(echo $scriptdir | sed -En 's/(.*\/autosetup).*/\1/p') 
    echo "Working Directory: $scriptdir"
    echo "Repository Directory: $repo"
    packages=$repo/common/packages
    configs=$repo/common/configs
    snippets=$repo/common/snippets
    services=$repo/common/services
    cd $scriptdir
fi
