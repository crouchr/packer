#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh

echo 'Running add-user-oscar.sh...'

USER=oscar
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:NvidiaNvidia2006!" | sudo chpasswd
sudo usermod -aG docker ${USER}
