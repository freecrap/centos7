#!/bin/bash

WORKDIR=`pwd`

echo "============================================================================================================================================================="
echo " Installing node.js"
echo "============================================================================================================================================================="

curl --silent --location https://rpm.nodesource.com/setup_8.x | bash -
yum -y install nodejs
npm -v
node -v
npm install -g node-gyp
npm install -g yarn

cd $WORKDIR
rm -- "$0"
