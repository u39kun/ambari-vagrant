#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
rm -rf /etc/zypp/repos.d/SUSE*
#zypper install iptables curl wget
cp /vagrant/opensuse.repo /etc/zypp/repos.d/
zypper  --non-interactive remove gcc43 cpp43 
zypper --non-interactive install --force-resolution  rrdtool
mkdir -p /root/.ssh; chmod 600 /root/.ssh; cp /home/vagrant/.ssh/authorized_keys /root/.ssh/

# Increasing swap space
sudo -u root dd if=/dev/zero of=/swapfile bs=1024 count=3072k
sudo -u root /sbin/mkswap /swapfile
sudo -u root /sbin/swapon /swapfile
sudo -u root /bin/echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab

sudo -u root zypper  --non-interactive remove rrdtool 
sudo -u root cp /vagrant/HDP-UTILS.repo /etc/zypp/repos.d
sudo -u root zypper clean
sudo -u root /usr/bin/zypper --non-interactive --quiet install --auto-agree-with-licenses  python-rrdtool-1.4.5
sudo -u root rm /etc/zypp/repos.d/HDP-UTILS.repo -f
sudo -u root zypper clean

sudo cp /vagrant/insecure_private_key /root/ec2-keypair
sudo chmod 600 /root/ec2-keypair
