#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh

echo 'Running add-user-simon.sh...'

USER=simon
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:FishTank1971!" | sudo chpasswd
sudo usermod -aG docker ${USER}