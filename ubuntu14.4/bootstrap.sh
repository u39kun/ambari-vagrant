#!/usr/bin/env bash
cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

# Increasing swap space
dd if=/dev/zero of=/swapfile bs=1024 count=3072k
mkswap /swapfile
swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab

cp /vagrant/insecure_private_key /root/insecure_private_key
chmod 600 /root/insecure_private_key
