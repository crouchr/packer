#!/bin/bash -eux

echo "Installing NTPd..."

# Need accurate time
sudo yum -y install ntp

echo "Starting NTPd..."
sudo systemctl enable ntpd
sudo systemctl start ntpd

