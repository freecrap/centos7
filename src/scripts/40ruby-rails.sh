#!/bin/bash

WORKDIR=`pwd`

echo "============================================================================================================================================================="
echo " Installing rvm"
echo "============================================================================================================================================================="

# Some problem here with the gpg keys...
gpg2 --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh

rvm install 2.5.5
rvm use 2.5.5 --default

source /etc/profile.d/rvm.sh

# at this point we should logoffski for rvm profile to take effect

gem install bundler

export PATH="/usr/pgsql-11/bin:$PATH"

gem install pg -- --with-pg-config=/usr/pgsql-11/bin/pg_config

# assuming there's a Gemfile here...
cd /root/src && bundle install


wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
sudo yum -y localinstall google-chrome-stable_current_x86_64.rpm
rm -rf google-chrome-stable_current_x86_64.rpm


# create and chmod a dir for passenger to compile native support for current ruby interpreter
mkdir -p /.passenger
chmod -R 777 /.passenger

# EPEL for phusion passenger
curl --fail -sSLo /etc/yum.repos.d/passenger.repo https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo
# nginx & passenger. this will also install some fucking ruby version for some reason. may just ignore it, the rvm one still works
yum install -y nginx
yum install -y passenger passenger-devel

echo "y" | passenger-install-apache2-module --auto -a


cd $WORKDIR
rm -- "$0"
