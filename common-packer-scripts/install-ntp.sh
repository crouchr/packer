#!/bin/bash -eux

echo "Installing NTPd..."

# Need accurate time or Chef knife won't allow bootstrapping
sudo yum -y install ntp   # yes, its ntp not ntpd

echo "Starting NTPd..."
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

