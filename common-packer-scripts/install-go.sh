#!/bin/bash -eux
# Install Go - needed by Filebeats
# https://www.ovhcloud.com/en-gb/community/tutorials/how-to-install-go-centos/

echo "Installing Go..."

sudo curl https://dl.google.com/go/go1.18.2.linux-amd64.tar.gz --output go1.18.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version
