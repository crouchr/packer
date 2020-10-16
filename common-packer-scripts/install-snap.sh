#!/usr/bin/env bash
# Install Snap package manager
# https://snapcraft.io/install/termshark/centos

echo "Installing Snap package manager..."
sudo yum -y install snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap

# Wait until seeding has completed
sudo snap wait system seed.loaded
