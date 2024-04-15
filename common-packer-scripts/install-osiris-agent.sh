#!/bin/bash -eux

echo 'Installing Osiris Agent v4.2.3...'

wget -O /tmp/osiris-agent-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz  http://192.168.1.4/source-code/osiris-agent-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz
cd /tmp     # BEWARE - a directory change !
tar xfvz osiris-agent-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz
# cd osiris-agent-4.2.3-release

# An expect script is used to perform a basic installation
# sudo cp /tmp/install-osiris-agent.exp /tmp/install-osiris-agent.exp
sudo chmod +x /tmp/install-osiris-agent.exp
sudo chown vagrant:vagrant /tmp/install-osiris-agent.exp

pwd
ls -laF

# Perform the installation using 'expect' script
# sudo ./install-osiris-agent.exp

# override the default config file
# sudo cp /tmp/ossec.conf /var/ossec/etc/ossec.conf
# sudo /var/ossec/bin/ossec-control enable client-syslog


# sudo systemctl enable ossec.service
# sudo systemctl start ossec.service
# sudo systemctl status ossec.service

cd /home/vagrant

echo "Finished setup.sh OK for provisioning Osiris Agent v4.2.3 on this node"
echo
