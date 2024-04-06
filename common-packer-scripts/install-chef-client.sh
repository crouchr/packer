#!/bin/bash -eux
# Install Chef Client

# FIXME : hostname of ansible-packer node breaks so have to use IP

# CHEF_CLIENT_VERSION=18.4.12   # use same as VCC

echo 'Running install-chef-client.sh to install Opscode Chef Client...'

USER=vagrant

# FIXME : pull from 192.168.1.4
# Install latest version of Chef Client - speeds up chef solo provisioning of Box
sudo curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -v ${CHEF_CLIENT_VERSION}

# why do I need this directory ?
#sudo mkdir -p /home/${USER}/.chef
# sudo chown ${USER}:${USER} /home/${USER}/.chef

# why do I need this directory ?
# sudo mkdir -p /home/${USER}/chef-repo
# sudo chown ${USER}:${USER} /home/${USER}/chef-repo

sudo mkdir -p /etc/chef
sudo mkdir -p /etc/chef/trusted_certs
sudo chown -R ${USER}:${USER} /etc/chef

# Chef client log file
sudo mkdir /var/log/chef
sudo touch /var/log/chef/client.log

# files that must not be stored in public repo - store on Slackware 15 web-server
sudo curl -o /tmp/crouchr.pem http://192.168.1.4/chef-pems/crouchr.pem
sudo curl -o /tmp/vagrant.pem http://192.168.1.4/chef-pems/vagrant.pem
sudo curl -o /tmp/ermin-validator.pem http://192.168.1.4/chef-pems/ermin-validator.pem
sudo curl -o /tmp/chef.crt http://192.168.1.4/chef-pems/chef.crt

sudo cp /tmp/client.rb /etc/chef/client.rb
sudo cp /tmp/crouchr.pem /etc/chef/crouchr.pem
sudo cp /tmp/vagrant.pem /etc/chef/vagrant.pem
sudo cp /tmp/ermin-validator.pem /etc/chef/ermin-validator.pem
