Start with 4 barebone CentOS 6.4 VMs.

Install and configure Ambari Agent on all hosts:

    pdsh -w root@c640[1-4].ambari.apache.org 'sh /vagrant/blueprint-demo/prep-agent.sh'

Install and configure Ambari Server on c6401:

    ssh root@c6401.ambari.apache.org 'sh /vagrant/blueprint-demo/prep-server.sh'

Check to see all Ambari Agents have registered with Ambari Server:

    sh list-hosts.sh

List all Blueprints (none should exist):

    sh list-blueprints.sh

Create Blueprint:

    sh create-blueprint.sh

List all Blueprints (one just reated should exist):

    sh list-blueprints.sh

Deploy cluster using Blueprint:

    sh deploy-cluster.sh
    
Check deployment status:

    sh check-deploy-status.sh


