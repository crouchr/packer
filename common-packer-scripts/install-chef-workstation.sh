#!/bin/bash -eux
# Install Chef Workstation - i.e. includes knife which Chef Client does not

# CHEF_CLIENT_VERSION=18.4.12   # use same as VCC

echo 'Running install-chef-workstation.sh to install Opscode Chef WorkstationC...'

USER=vagrant

# Install latest version of Chef Client - speeds up chef solo provisioning of Box
# sudo curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -v ${CHEF_CLIENT_VERSION}

# file copied using files provisioner
sudo yum -y localinstall /tmp/chef-workstation-24.2.1058-1.el7.x86_64.rpm

# why do I need this directory ?
#sudo mkdir -p /home/${USER}/.chef
# sudo chown ${USER}:${USER} /home/${USER}/.chef

# why do I need this directory ?
# sudo mkdir -p /home/${USER}/chef-repo
# sudo chown ${USER}:${USER} /home/${USER}/chef-repo

sudo mkdir -p /etc/chef
sudo chown ${USER}:${USER} /etc/chef

# Chef client log file
sudo mkdir /var/log/chef
sudo touch /var/log/chef/client.log

# Chef files previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/client.rb /etc/chef/client.rb
sudo cp /tmp/crouchr.pem /etc/chef/crouchr.pem
sudo cp /tmp/ermin-validator.pem /etc/chef/ermin-validator.pem
