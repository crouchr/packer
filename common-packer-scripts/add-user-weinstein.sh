#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh
# I have access to this account

echo 'Running add-user-weinstein.sh...'

USER=weinstein
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Tradr1066!" | sudo chpasswd
sudo usermod -aG docker ${USER}
