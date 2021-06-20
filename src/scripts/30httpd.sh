#!/bin/bash

WORKDIR=`pwd`

echo "============================================================================================================================================================="
echo " Setting up apache web server "
echo "============================================================================================================================================================="


ln -s /var/log/httpd /etc/httpd/logs
ln -s /usr/lib64/httpd/modules /etc/httpd/modules
ln -s /run/httpd /etc/httpd/run


echo " Install mod_cloudflare"
git clone https://github.com/cloudflare/mod_cloudflare.git
cd mod_cloudflare

apxs -a -i -c mod_cloudflare.c

cd ..
rm -rf mod_cloudflare


cd $WORKDIR
rm -- "$0"
