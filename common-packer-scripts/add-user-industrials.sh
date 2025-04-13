#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh

echo 'Running add-user-industrials.sh...'

USER=industrials
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Tradr1066!" | sudo chpasswd
sudo usermod -aG docker ${USER}
