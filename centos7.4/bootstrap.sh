#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install ntp -y
service ntpd start
#service iptables stop
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

#Again, stopping iptables
# /etc/init.d/iptables stop

# Increasing swap space
sudo dd if=/dev/zero of=/swapfile bs=1024 count=1024k
sudo mkswap /swapfile
sudo swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab

sudo cp /vagrant/insecure_private_key /root/ec2-keypair
sudo chmod 600 /root/ec2-keypair

# Workaround from https://www.digitalocean.com/community/questions/can-t-install-mysql-on-centos-7
# rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
