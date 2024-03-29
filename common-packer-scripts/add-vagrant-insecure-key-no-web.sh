#!/bin/bash -eux
# This version does not rely on web.ermin running

#sudo wget --no-check-certificate \
#          https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub \
#          -O /home/vagrant/.ssh/authorized_keys

echo "Entered add-vagrant-insecure-key-no-web.sh"

USER=vagrant

sudo mkdir -p /home/${USER}/.ssh

# Use my own local copy
#sudo wget --no-check-certificate \
#   http://web.ermin/public-keys/vagrant.pub \
#   -O /home/${USER}/.ssh/authorized_keys

# curl is in installer but wget is not
# sudo curl -o /home/${USER}/.ssh/authorized_keys http://web.ermin.lan/public-keys/vagrant.pub
sudo cp /tmp/vagrant.pub /home/${USER}/.ssh/authorized_keys

sudo chmod 0700 /home/${USER}/.ssh
sudo chmod 0600 /home/${USER}/.ssh/authorized_keys
sudo chown -R vagrant /home/${USER}/.ssh

sudo tree -a
sudo ls -laF

echo "Exited add-vagrant-insecure-key-no-web.sh"
