#!/bin/bash -eux

echo 'Installing Osiris...'

# sudo yum install -y inotify- bind-utils

# keep installation files 'tidied away'
# sudo mkdir -p /home/vagrant/installer

wget -O /tmp/osiris-4.2.3.tar.gz  http://192.168.1.4/source-code/osiris-4.2.3.tar.gz
cd /tmp     # BEWARE - a directory change !
# tar xfvz osiris-4.2.3.tar.gz
# cd osiris-4.2.3

# An expect script is used to perform a basic installation
# sudo cp /tmp/install-ossec-local.exp /home/vagrant/installer/install-ossec-local.exp
# sudo chmod +x /home/vagrant/installer/install-ossec-local.exp
# sudo chown vagrant:vagrant /home/vagrant/installer/install-ossec-local.exp

# cd /home/vagrant
# pwd
# ls -laF
# sudo ./home/vagrant/installer/install-ossec-local.exp

# override the default config file
# sudo cp /tmp/ossec.conf /var/ossec/etc/ossec.conf


# sudo /var/ossec/bin/ossec-control enable client-syslog

# sudo systemctl enable ossec.service
# sudo systemctl start ossec.service
# sudo systemctl status ossec.service

echo "Finished setup.sh OK for provisioning Osiris v4.2.3 on this node"
echo
