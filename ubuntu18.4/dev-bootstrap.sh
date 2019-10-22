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
wget http://nodejs.org/dist/v0.10.31/node-v0.10.31-linux-x64.tar.gz
tar zxvf node-v0.10.31-linux-x64.tar.gz
mv node-v0.10.31-linux-x64 /usr/share/node
/usr/share/node/bin/npm install -g brunch
#wget --no-check-certificate http://pypi.python.org/packages/2.6/s/setuptools/setuptools-0.6c11-py2.6.egg
#sh setuptools-0.6c11-py2.6.egg
wget http://psg.mtu.edu/pub/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
tar zxvf apache-maven-3.0.5-bin.tar.gz
mv apache-maven-3.0.5 /usr/share/maven
apt-get install openjdk-6-jdk -y

# make maven and node available in PATH
echo 'PATH=$PATH:/usr/share/node/bin' > /etc/profile.d/node.sh
chmod +x /etc/profile.d/node.sh
echo 'PATH=$PATH:/usr/share/maven/bin' > /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh

# check out Ambari source

echo 'Ambari Development VM has been set up! Enjoy!'
echo 'You can check out Ambari source by running: git clone https://git-wip-us.apache.org/repos/asf/ambari.git'
