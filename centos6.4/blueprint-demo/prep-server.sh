wget http://public-repo-1.hortonworks.com/ambari/centos6/1.x/updates/1.6.0/ambari.repo -O /etc/yum.repos.d/ambari.repo
yum install ambari-server -y
ambari-server setup -s
ambari-server start

