#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh

echo 'Running add-user-amelia.sh...'

USER=amelia
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:AmeliaChicken2006!" | sudo chpasswd
sudo usermod -aG docker ${USER}

