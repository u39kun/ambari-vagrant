Cluster Deployment using Blueprint API (Demo)
----
The scripts contained in this folder demonstrates how to deploy a cluster using Ambari Blueprint API.

Instructions
----
Start with 4 barebone CentOS 6.4 VMs.

Install and configure Ambari Agent on all hosts:

    pdsh -w root@c640[1-4].ambari.apache.org 'sh /vagrant/blueprint-demo/prep-agent.sh'

Install and configure Ambari Server on c6401:

    ssh root@c6401.ambari.apache.org 'sh /vagrant/blueprint-demo/prep-server.sh'

Check to see all Ambari Agents have registered with Ambari Server:

    sh list-hosts.sh

List all Blueprints (none should exist):

    sh list-blueprints.sh

Create Blueprint (Ambari 1.6.1 and earlier):

    sh create-blueprint.sh

Create Blueprint (Ambari 1.7.0):

    sh create-blueprint-170.sh

List all Blueprints (one just reated should exist):

    sh list-blueprints.sh

Deploy cluster using Blueprint (Ambari 1.6.1 and earlier):

    sh deploy-cluster.sh

Deploy cluster using Blueprint (Ambari 1.7.0):

    sh deploy-cluster-170.sh

Check deployment status:

    sh check-deploy-status.sh


