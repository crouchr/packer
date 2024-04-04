#!/bin/bash -eux
# Install Chef Workstation - i.e. includes knife which Chef Client does not

# FIXME : hostname of ansible-packer node breaks so have to use IP

# CHEF_CLIENT_VERSION=18.4.12   # use same as VCC

echo 'Running install-chef-workstation.sh to install Opscode Chef WorkstationC...'

USER=vagrant

# Install latest version of Chef Client - speeds up chef solo provisioning of Box
# sudo curl -L https://www.chef.io/chef/install.sh | sudo bash -s -- -v ${CHEF_CLIENT_VERSION}


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

# files too big for repo - store on Slackware 15 web-server
sudo curl -o /tmp/chef-workstation-24.2.1058-1.el7.x86_64.rpm http://192.168.1.4/centos7-packages/chef-workstation-24.2.1058-1.el7.x86_64.rpm

# files that must not be stored in public repo - store on Slackware 15 web-server
sudo curl -o /tmp/client.pem http://192.168.1.4/chef-pems/crouchr.pem
sudo curl -o /tmp/ermin-validator.pem http://192.168.1.4/chef-pems/ermin-validator.pem

cat /tmp/client.pem
cat /tmp/ermin-validator.pem

# Chef files previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/client.rb /etc/chef/client.rb

# install config files
sudo cp /tmp/client.pem /etc/chef/client.pem
sudo cp /tmp/ermin-validator.pem /etc/chef/ermin-validator.pem

# install Chef Workstation
sudo yum -y localinstall /tmp/chef-workstation-24.2.1058-1.el7.x86_64.rpm
