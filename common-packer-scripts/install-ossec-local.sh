#!/bin/bash -eux

# Do not run this yet - it prompts for answers
# https://www.vultr.com/docs/how-to-install-ossec-hids-on-a-centos-7-server/
# https://linuxadmin.io/ossec-install-centos-7/

echo 'Installing OSSEC (local) v2.9.3...'

sudo yum install -y inotify- bind-utils

# keep installation files 'tidied away'
sudo mkdir -p /home/vagrant/installer

# Add Yum repo configuration
#wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash

wget -O /tmp/ossec.2.9.3.tar.gz  http://192.168.1.4/centos7-packages/ossec.2.9.3.tar.gz
cd /tmp     # BEWARE - a directory change !
tar xfvz ossec.2.9.3.tar.gz
cd ossec-hids-2.9.3

# An expect script is used to perform a basic installation
sudo cp /tmp/install-ossec-local.exp /home/vagrant/installer/install-ossec-local.exp
sudo chmod +x /home/vagrant/installer/install-ossec-local.exp
sudo chown vagrant:vagrant /home/vagrant/installer/install-ossec-local.exp

cd /home/vagrant
pwd
ls -laF
sudo ./home/vagrant/installer/install-ossec-local.exp

# override the default config file
sudo cp /tmp/ossec.conf /var/ossec/etc/ossec.conf


# sudo /var/ossec/bin/ossec-control enable client-syslog

sudo systemctl enable ossec.service
sudo systemctl start ossec.service
sudo systemctl status ossec.service

echo "Finished setup.sh OK for provisioning OSSEC (local) v2.9.3 on this node"
echo
