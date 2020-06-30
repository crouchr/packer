#!/usr/bin/env bash
# see https://serverfault.com/questions/709820/unattended-chef-client-installation
# do this after install-chef-client.sh
# Install credentials for Hosted Chef

# config
# ------
sudo wget --no-check-certificate \
   http://web.ermin.lan/private/bootstrap-chef-files/client.rb \
   -O /etc/chef/client.rb

sudo wget --no-check-certificate \
   http://web.ermin.lan/private/bootstrap-chef-files/validation.pem \
   -O /etc/chef/validation.pem

sudo mkdir -p /home/vagrant/.chef

sudo wget --no-check-certificate \
   http://web.ermin.lan/private/bootstrap-chef-files/knife.rb \
   -O /home/vagrant/.chef/knife.rb

sudo wget --no-check-certificate \
   http://web.ermin.lan/private/bootstrap-chef-files/first-run.json \
   -O /home/vagrant/first-run.json

# certs
# -----
sudo wget --no-check-certificate \
   http://web.ermin.lan/private/bootstrap-chef-files/crouchrermin.pem \
   -O /home/vagrant/.chef/crouchrermin.pem

sudo wget --no-check-certificate \
   http://web.ermin.lan/private/bootstrap-chef-files/blackrainermin-validator.pem \
   -O /home/vagrant/.chef/blackrainermin-validator.pem
