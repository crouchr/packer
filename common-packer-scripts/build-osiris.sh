#!/bin/bash

##!/bin/bash -eux
echo 'Installing Osiris v4.2.3...'

sudo yum install -y openssl-devel

wget -O /tmp/osiris-4.2.3.tar.gz  http://192.168.1.4/source-code/osiris-4.2.3.tar.gz
cd /tmp     # BEWARE - a directory change !
tar xfvz osiris-4.2.3.tar.gz
cd osiris-4.2.3
./configure --enable-fancy-cli=yes

echo "Make Linux agent installer package..."
make agent

echo "Make Linux management console installer package..."
make console

# show the built installers
ls -laF src/install/*.tar.gz
# [root@itg-iceberg osiris-4.2.3]# ls -laF src/install/*.tar.gz
# -rw-r--r--. 1 root root  76020 Apr 11 07:18 src/install/osiris-agent-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz
# -rw-r--r--. 1 root root 949663 Apr 11 07:23 src/install/osiris-console-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz

# Now manually copy these installers to the packer-ansible web server if they are needed on other nodes - e.g. the management console

# An expect script is used to perform a basic installation
# sudo cp /tmp/install-ossec-local.exp /home/vagrant/installer/install-ossec-local.exp
# sudo chmod +x /home/vagrant/installer/install-ossec-local.exp
# sudo chown vagrant:vagrant /home/vagrant/installer/install-ossec-local.exp

cd /home/vagrant
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
