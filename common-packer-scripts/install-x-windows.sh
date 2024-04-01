#!/usr/bin/env bash
# Minimum install of X to allow running X over ssh
# https://www.quora.com/How-can-I-install-X-Windows-on-CentOS-7

echo "Installing X Windows..."
sudo yum -y groupinstall "X Window System"
sudo yum -y install xorg-x11-apps

# echo "Installing MATE desktop..."
# sudo yum -y groupinstall "MATE Desktop"

echo "Installing Fluxbox Window Manager..."
sudo yum -y install fluxbox

# MATE
# echo "Enable LightDM..."
# sudo systemctl enable lightdm
# sudo systemctl start lightdm