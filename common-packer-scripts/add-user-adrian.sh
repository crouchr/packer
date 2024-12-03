#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh

echo 'Running add-user-adrian.sh...'

USER=adrian
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:NewMarket1968!" | sudo chpasswd
sudo usermod -aG docker ${USER}
