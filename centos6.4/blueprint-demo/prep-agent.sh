wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum install ambari-agent -y
export AMBARI_HOSTNAME=c6401.ambari.apache.org
sed "s/^hostname=.*/hostname=${AMBARI_HOSTNAME}/" -i /etc/ambari-agent/conf/ambari-agent.ini
ambari-agent start

