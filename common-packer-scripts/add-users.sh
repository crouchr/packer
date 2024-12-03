#!/bin/bash -eux
# This is not a TRADR User - it is a user for managing the TRADR Platform

echo 'Running add-users.sh...'

USER=crouchr
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
