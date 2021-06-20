#!/bin/bash

WORKDIR=`pwd`


echo "============================================================================================================================================================="
echo " Setting up phantomjs"
echo "============================================================================================================================================================="

yum -y install fontconfig-devel fontconfig freetype freetype-devel bzip2

wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /usr/local/share/
ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

cd $WORKDIR
rm -- "$0"
