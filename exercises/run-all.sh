#!/bin/bash

set -e

cd $(dirname $0)

for d in */ ; do
    cd $d
    if [ ! -f IGNORE ]; then
        ./run.sh
    fi
    cd ..
done
