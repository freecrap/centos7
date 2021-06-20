#!/bin/bash

WORKDIR=`pwd`

echo "============================================================================================================================================================="
echo " Setting up system"
echo "============================================================================================================================================================="

yum install -y epel-release yum-utils
yum-config-manager --enable epel
yum clean all && yum update -y
yum -y groupinstall 'Development Tools'
yum -y install sudo mc httpd wget curl mc nc netcat nmap iptables-services mariadb mysql-devel
yum -y install ImageMagick
yum -y install httpd httpd-tools httpd-devel libxml libxml-devel readline readline-devel ncurses ncurses-devel zlib zlib-devel openssl openssl-devel bzip2 bzip2-devel
yum -y install openssl openssl-devel curl wget curl-devel pygpgme
yum -y install gcc gcc-cpp gcc-c++ g++ glibc-devel make libyaml-devel libffi-devel glibc-headers autoconf automake libtool bison
yum -y install libxml2 libxml2-devel libxslt libxslt-devel patch patch-devel git
yum -y install zip unzip gzip gzip-devel install tar which
#yum -y install ntp
#yum -y install java-1.7.0-openjdk-headless java-1.7.0-openjdk
yum -y install chromedriver chromium
#yum -y install memcached memcache redis
#yum -y install nmap nc netcat iptables-services multitail screen
yum -y install python-devel python34-devel

cd $WORKDIR
rm -- "$0"
