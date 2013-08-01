#!/usr/bin/env bash

cp /vagrant/hosts /etc/hosts
cp /vagrant/resolv.conf /etc/resolv.conf
yum install iptables -y
cp /vagrant/epel.repo /etc/yum.repos.d
service ntpd start

