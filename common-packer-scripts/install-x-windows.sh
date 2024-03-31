#!/usr/bin/env bash
# https://www.quora.com/How-can-I-install-X-Windows-on-CentOS-7

echo "Installing X Windows..."
sudo yum -y groupinstall "X Window System"

echo "Installing MATE desktop..." # what about fluxbox ?
sudo yum -y groupinstall "MATE Desktop"

echo "Enable GDM..."
sudo systemctl enable lightdm
sudo systemctl start lightdm
