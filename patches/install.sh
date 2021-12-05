#!/bin/sh

echo $1
rootdirectory="$PWD"

dirs="system/core frameworks/base"

# red + nocolor
RED='\033[0;31m'
NC='\033[0m'

for dir in $dirs ; do
    cd $rootdirectory
    cd $dir
    echo "Applying ${dir} patches...\n"
    git apply -v $rootdirectory/device/bq/mt6592-common/patches/$dir/*.patch
done

echo -e "Done !\n"
cd $rootdirectory
