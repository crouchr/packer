#!/bin/bash -eux

# Needed by Python

echo 'Running install-dev-tools.sh...'

sudo yum -y groupinstall "Development Tools"

