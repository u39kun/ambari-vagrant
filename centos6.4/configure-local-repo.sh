#!/bin/sh

sed -i 's/dev.hortonworks.com.s3.amazonaws.com/64.143.228.227/g' /var/lib/ambari-server/resources/stacks/HDPLocal/2.0.6/repos/repoinfo.xml

