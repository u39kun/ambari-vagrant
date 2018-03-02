#!/bin/sh

echo "Entropy before installing RNG tools"
cat /proc/sys/kernel/random/entropy_avail 

# Install packages
echo "Installing RNG tools"
yum install -y rng-tools
chkconfig rngd on 
service rngd start

echo "Entropy after installing  RNG tools"
cat /proc/sys/kernel/random/entropy_avail 

echo "Installing Kerberos Packages"
yum install -y krb5-server krb5-libs krb5-workstation

# #################################
# Assming default configuration!!!!
# #################################
REALM="EXAMPLE.COM"

# Create krb5.conf file
HOSTNAME=`hostname`
echo "Creating krb5.conf file, KDC host is ${HOSTNAME} and realm is ${REALM}"
cat >/etc/krb5.conf <<EOF
[logging]
 default = FILE:/var/log/krb5libs.log
 kdc = FILE:/var/log/krb5kdc.log
 admin_server = FILE:/var/log/kadmind.log

[libdefaults]
 default_realm = ${REALM}
 dns_lookup_realm = false
 dns_lookup_kdc = false
 ticket_lifetime = 24h
 renew_lifetime = 7d
 forwardable = true

[realms]
 ${REALM} = {
  kdc = ${HOSTNAME}
  admin_server = ${HOSTNAME}
 }

[domain_realm]
 .${HOSTNAME} = ${REALM}
 ${HOSTNAME} = ${REALM}
EOF

# Create kdam5.aclfile
echo "Creating kadm5.acl file, realm is ${REALM}"
cat >/var/kerberos/krb5kdc/kadm5.acl <<EOF
*/admin@${REALM}    *
EOF

# Create KDC database
echo "Created KDC database, this could take some time"
kdb5_util create -s -P hadoop

# Create admistrative user
echo "Creating administriative account:"
echo "  principal:  admin/admin"
echo "  password:   hadoop"
kadmin.local -q 'addprinc -pw hadoop admin/admin'

# Starting services
echo "Starting services"
service krb5kdc start
service kadmin start

chkconfig krb5kdc on
chkconfig kadmin on
