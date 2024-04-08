#!/bin/bash -eux

set -e	# bomb out if any problem

echo
echo "Started setup.sh for provisioning 'motd' on this node"

sudo cp /tmp/motd /etc/motd

echo "Finished setup.sh OK for provisioning 'motd' on this node"
echo
