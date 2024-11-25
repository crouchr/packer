#!/bin/bash -eux

echo 'Running add-user-adrian.sh...'

USER=richard
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
echo "richard:Faguar1968!" | sudo chpasswd
