#!/bin/bash -eux

echo "Installing Jython..."

sudo yum -y install grafana
sudo mkdir -p /etc/grafana

# jython installer previously copied into VBOX /tmp dir using file provisioner
sudo cp /tmp/jython-installer-2.7.3.jar /tmp/jython-installer-2.7.3.jar

# Do the install here once I know what it is

