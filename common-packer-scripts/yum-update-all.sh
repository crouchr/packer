#!/bin/bash -eux

# Add the EPEL repo
sudo yum install -y epel-release

# Update everything
sudo yum update -y
