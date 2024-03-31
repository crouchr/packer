#!/bin/bash -eux

echo "Configuring SSHD..."

# grafana.ini previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/ssh/sshd_config /etc/ssh/sshd_config
