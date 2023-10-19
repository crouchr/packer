#!/bin/bash -eux

echo 'Running add-users.sh...'

USER=crouchr
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh

