#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf

zypper --non-interactive in wget expect git
zypper --non-interactive in gcc-c++
zypper --non-interactive in rpmrebuild
zypper --non-interactive in java-1_6_0-openjdk-devel

wget http://www.bizdirusa.com/mirrors/apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz
tar zxvf apache-maven-3.0.5-bin.tar.gz
mv apache-maven-3.0.5 /usr/share/maven

wget http://nodejs.org/dist/v0.10.25/node-v0.10.25-linux-x64.tar.gz
tar zxf node-v0.10.25-linux-x64.tar.gz
mv node-v0.10.25-linux-x64 /usr/share/node
/usr/share/node/bin install -g brunch@1.7.13

wget --no-check-certificate http://pypi.python.org/packages/2.6/s/setuptools/setuptools-0.6c11-py2.6.egg
sh setuptools-0.6c11-py2.6.egg --install-dir /usr/lib64/python2.6/site-packages/

wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.63.tar.gz;
tar xvzf autoconf-2.63.tar.gz
cd autoconf-2.63
./configure --prefix=/usr
make
make PYTHON=python2.6 install
cd -

wget -q https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.gz
tar xvzf protobuf-2.5.0.tar.gz
cd protobuf-2.5.0
./configure --prefix=/opt
make
make install
cd -

echo "export PATH=$PATH:/usr/share/maven/bin:/usr/share/node/bin" >/etc/profile.local
source /etc/profile.local
