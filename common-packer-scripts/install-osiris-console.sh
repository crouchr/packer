#!/bin/bash -eux

echo 'Installing Osiris Management Console v4.2.3...'

wget -O /tmp/osiris-console-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz  http://192.168.1.4/source-code/osiris-console-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz
cd /tmp     # BEWARE - a directory change !
tar xfvz osiris-console-4.2.3-release-x86_64-Linux-3.10.0-1160.114.2.el7.x86_64.tar.gz

# An expect script is used to perform a basic installation
sudo cp /tmp/install-osiris-console.exp /tmp/osiris-console-4.2.3-release/install-osiris-console.exp
sudo chmod +x /tmp/osiris-console-4.2.3-release/install-osiris-console.exp
sudo chown vagrant:vagrant /tmp/osiris-console-4.2.3-release/install-osiris-console.exp
cd /tmp/osiris-console-4.2.3-release
pwd
ls -laF

# Perform the installation using 'expect' script
sudo ./install-osiris-console.exp

cd /home/vagrant

echo "Finished setup.sh OK for provisioning Osiris Management Console v4.2.3 on this node"
echo
