#!/bin/bash -eux
# https://stackoverflow.com/questions/22643177/ssh-onto-vagrant-box-with-different-username

echo 'Running dump-info.sh...'

whoami

sudo cat /etc/ssh/sshd_config
df -h

echo "User groups:"
sudo cat /etc/group

echo "Users:"
sudo cat /etc/passwd

echo "resolv.conf:"
sudo cat /etc/resolv.conf

echo "hosts:"
sudo cat /etc/hosts

# Show all files
echo "==================================================="
sudo tree /etc/chef
echo "==================================================="
sudo tree /home/vagrant
echo "==================================================="

# List all the installed packages
sudo yum list installed
