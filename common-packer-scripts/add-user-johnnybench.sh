#!/bin/bash -eux

echo 'Running add-user-johnnybench.sh...'

USER=johnnybench
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "${USER}:Faguar1968!" | sudo chpasswd
sudo usermod -aG docker ${USER}