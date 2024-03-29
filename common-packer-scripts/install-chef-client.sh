#!/bin/bash -eux
# Install Chef Client

#CHEF_CLIENT_VERSION=16.2.73 - known to work
CHEF_CLIENT_VERSION=18.3.0

echo 'Running install-chef-client.sh to install Opscode Chef Client...'

USER=vagrant

# Install latest version of Chef Client - speeds up chef solo provisioning of Box
sudo curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -v ${CHEF_CLIENT_VERSION}
# sudo curl -L https://omnitruck.cinc.sh/install.sh | sudo bash -s -- -v 18

sudo mkdir -p /home/${USER}/.chef
sudo chown ${USER}:${USER} /home/${USER}/.chef

sudo mkdir -p /home/${USER}/chef-repo
sudo chown ${USER}:${USER} /home/${USER}/chef-repo

sudo mkdir -p /etc/chef
sudo chown ${USER}:${USER} /etc/chef
