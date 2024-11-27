#!/bin/bash -eux

echo "Installing fail2ban..."

sudo yum -y install fail2ban

echo "Configuring fail2ban..."
sudo cp /tmp/jail.local /etc/fail2ban/jail.local

echo "Starting fail2ban..."
# Do not run it yet - the config file is no good
# sudo systemctl start fail2ban
# sudo systemctl enable fail2ban

echo "Installed fail2ban."
