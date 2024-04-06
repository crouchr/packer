#!/usr/bin/env bash
# Do not run this yet - it prompts for answers
# https://www.vultr.com/docs/how-to-install-ossec-hids-on-a-centos-7-server/
# https://linuxadmin.io/ossec-install-centos-7/

echo 'Installing OSSEC agent v2.9.3...'

sudo yum install -y inotify- bind-utils

# Add Yum repo configuration
#wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash


wget -O /tmp/ossec.2.9.3.tar.gz  http://192.168.1.4/centos-packages/ossec.2.9.3.tar.gz
cd /tmp
tar xfvz ossec.2.9.3.tar.gz

cd ossec-hids-2.9.3
#./install.sh

# Server
# sudo yum install -y ossec-hids-server

# Agent
#sudo yum install -y ossec-hids-agent

echo "Finished setup.sh OK for provisioning OSSEC agent v2.9.3 on this node"
echo