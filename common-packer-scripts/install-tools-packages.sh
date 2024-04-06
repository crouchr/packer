#!/bin/bash -eux

# Core utilities
# chef needs git

echo 'Running install-tools-packages.sh...'

sudo yum install -y yum-utils git wget lsof net-tools htop bind-utils jq expect

# Add packages I personally like to use
sudo yum install -y joe shadow-utils tree ncdu nano

