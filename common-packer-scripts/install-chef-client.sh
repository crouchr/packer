#!/usr/bin/env bash
# Install Chef Client

USER=vagrant
#CHEF_CLIENT_VERSION=16.2.73 - known to work
CHEF_CLIENT_VERSION=18.3.0

# Install latest version of Chef Client - speeds up chef solo provisioning of Box
sudo curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -v ${CHEF_CLIENT_VERSION}

sudo mkdir -p /home/${USER}/.chef
sudo chown ${USER}:${USER} /home/${USER}/.chef

sudo mkdir -p /home/${USER}/chef-repo
sudo chown ${USER}:${USER} /home/${USER}/chef-repo

sudo mkdir -p /etc/chef
sudo chown ${USER}:${USER} /etc/chef
