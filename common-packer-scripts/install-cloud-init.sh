#!/usr/bin/env bash
# Note : original NVM Packer build included cloud-init installed during Kick Start

echo "Installing cloud-init..."

sudo yum install -y cloud-init
