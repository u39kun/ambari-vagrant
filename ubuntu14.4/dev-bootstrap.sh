#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
apt-get update
apt-get install ntp -y
service ntp start

# install tools necessary to build Ambari
apt-get install make -y
apt-get install g++ -y
apt-get install git -y
apt-get install python-dev
apt-get install openjdk-7-jdk -y
apt-get install maven -y
apt-get install nodejs-legacy -y
apt-get install npm -y
/usr/bin/npm install -g brunch
