#!/bin/bash -eux

echo 'Running add-user-elliot.sh...'

USER=elliot
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:ElliotImperial2004!" | sudo chpasswd
sudo usermod -aG docker ${USER}

