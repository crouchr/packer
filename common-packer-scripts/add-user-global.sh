#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh
# Country ETFs go in here
echo 'Running add-user-global.sh...'

USER=global
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Tradr1066!" | sudo chpasswd
sudo usermod -aG docker ${USER}
