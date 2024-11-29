#!/bin/bash -eux

echo 'Running add-user-admin.sh...'

USER=admin
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "admin:Faguar1968!" | sudo chpasswd
sudo usermod -aG docker ${USER}

