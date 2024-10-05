#!/bin/bash -eux
#
# This is the highest version of Wazuh I can get to compile from source on CentOS7
#
# Do not run this yet - it prompts for answers
# https://www.vultr.com/docs/how-to-install-ossec-hids-on-a-centos-7-server/
# https://linuxadmin.io/ossec-install-centos-7/

echo 'Installing Wazuh v3.3.1 (local) ...'

sudo yum install -y inotify bind-utils pcre2-devel zlib-devel libevent-devel systemd-devel openssl-devel

# keep installation files 'tidied away'
sudo mkdir -p /home/vagrant/installer

# Add Yum repo configuration
#wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash

wget -O /tmp/wazuh-3.3.1.tar.gz  http://192.168.1.4/source-code/wazuh-3.3.1.tar.gz
cd /tmp     # BEWARE - a directory change !
sudo tar xfvz wazuh-3.3.1.tar.gz
cd wazuh-3.3.1

# An expect script is used to perform a basic installation
sudo cp /tmp/install-wazuh-local.exp /home/vagrant/install-wazuh-local.exp
sudo chmod +x /home/vagrant/install-wazuh-local.exp
sudo chown vagrant:vagrant /home/vagrant/install-wazuh-local.exp

cd /home/vagrant
pwd
ls -laF
# export PCRE2_SYSTEM=yes         # not needed in Ossec 2, can also add SQL env var here to build in Mysql support
sudo ./install-wazuh-local.exp

# override the default config file
sudo cp /tmp/ossec.conf /var/ossec/etc/ossec.conf

# install local rules to prevent rules firing for monitoring nodes e.g. Kuma
sudo cp /tmp/local_rules.xml /var/ossec/ruleset/rules/local_rules.xml

# Note : systemctl stuff is done by the install.sh script
echo "Finished setup.sh OK for provisioning Wazuh on this node"

echo


