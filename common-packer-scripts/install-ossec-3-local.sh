#!/bin/bash -eux
# To be customised to Ossec 3

# Do not run this yet - it prompts for answers
# https://www.vultr.com/docs/how-to-install-ossec-hids-on-a-centos-7-server/
# https://linuxadmin.io/ossec-install-centos-7/

echo 'Installing OSSEC (local) v3.7.0...'

sudo yum install -y inotify bind-utils pcre2-devel zlib-devel libevent-devel systemd-devel openssl-devel

# keep installation files 'tidied away'
sudo mkdir -p /home/vagrant/installer

# Add Yum repo configuration
#wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash

wget -O /tmp/ossec-hids-3.7.0.tar.gz  http://192.168.1.4/source-code/ossec-hids-3.7.0.tar.gz
cd /tmp     # BEWARE - a directory change !
sudo tar xfvz ossec-hids-3.7.0.tar.gz
cd ossec-hids-3.7.0

# An expect script is used to perform a basic installation
sudo cp /tmp/install-ossec-local.exp /home/vagrant/install-ossec-local.exp
sudo chmod +x /home/vagrant/install-ossec-local.exp
sudo chown vagrant:vagrant /home/vagrant/install-ossec-local.exp

cd /home/vagrant
pwd
ls -laF
export PCRE2_SYSTEM=yes
sudo ./install-ossec-local.exp

# override the default config file
sudo cp /tmp/ossec.conf /var/ossec/etc/ossec.conf

sudo systemctl enable ossec.service
sudo systemctl start ossec.service
sudo systemctl status ossec.service

echo "Finished setup.sh OK for provisioning OSSEC (local) v3.7.0 on this node"

echo
