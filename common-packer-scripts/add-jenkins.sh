#!/bin/bash -eux
# Needed on web-server : Add jenkins into apache group so it can upload files

USER=jenkins
sudo adduser ${USER}
sudo gpasswd -a ${USER} wheel
sudo mkdir -p /home/${USER}/.ssh
