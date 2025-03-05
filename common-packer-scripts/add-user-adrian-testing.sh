#!/bin/bash -eux
# also need to add user to install-tradr-shell.sh
# This is only for me to use for testing advice against Adrians' dividend portfolio

echo 'Running add-user-adrian-testing.sh...'

USER=adriantesting
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Faguar1968!" | sudo chpasswd
sudo usermod -aG docker ${USER}
