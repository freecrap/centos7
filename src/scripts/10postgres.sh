#!/bin/bash

WORKDIR=`pwd`

echo "============================================================================================================================================================="
echo " Installing Postgres packages"
echo "============================================================================================================================================================="

cd /root

# install scl to get rid of llvm error
yum install centos-release-scl -y

# must install the repo first
#wget https://yum.postgresql.org/11/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm # no longer works
# updated
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm

yum -y install pgdg-redhat-repo-latest.noarch.rpm
yum -y --nogpgcheck install postgresql11* libpq libpq-devel libpqxx libpqxx-devel
rm -rf pgdg-redhat-repo-latest.noarch.rpm


# add it to the path so the rails bundler can find the headers required for the pg gem
echo " Setting up postgres in the path"
export PATH="/usr/pgsql-11/bin:$PATH"

cd $WORKDIR
rm -- "$0"
