#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh

echo 'Running add-user-watcher.sh...'

USER=watcher
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Faguar1968!" | sudo chpasswd
sudo usermod -aG docker ${USER}
