#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start

# install tools necessary to build Ambari
yum install git -y
yum install rpm-build -y
yum install gcc-c++ -y
wget https://nodejs.org/dist/v8.11.2/node-v8.11.2-linux-x64.tar.xz
tar zxvf node-v8.11.2-linux-x64.tar.xz
mv node-v8.11.2-linux-x64 /usr/share/node
/usr/share/node/bin/npm install -g brunch
wget --no-check-certificate https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea
sh setuptools-0.6c11-py2.7.egg
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
tar zxvf apache-maven-3.5.3-bin.tar.gz
mv apache-maven-3.5.3 /usr/share/maven
yum install java-1.8.0-openjdk-devel -y

# make maven and node available in PATH
echo 'pathmunge /usr/share/node/bin' > /etc/profile.d/node.sh
chmod +x /etc/profile.d/node.sh
echo 'pathmunge /usr/share/maven/bin' > /etc/profile.d/maven.sh
chmod +x /etc/profile.d/maven.sh

echo 'Ambari Development VM has been set up! Enjoy!'
