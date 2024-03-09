#!/bin/bash -eux

echo "Installing NTPd..."

# Need accurate time
yum -y install ntp

echo "Starting NTPd..."
systemctl enable ntpd
systemctl start ntpd

