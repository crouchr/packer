#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh
# User whose trades correspond to Chris Vermuellen in Revesting Book

echo 'Running add-user-chris.sh...'

USER=chris
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Tradr1066!" | sudo chpasswd
sudo usermod -aG docker ${USER}

