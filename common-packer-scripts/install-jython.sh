#!/bin/bash -eux

echo "Installing Jython..."

# Jython installer previously copied into VBOX /tmp dir using file provisioner
# sudo cp /tmp/jython-installer-2.7.3.jar /tmp/jython-installer-2.7.3.jar

# Do the install here once I know what it is

export PATH=$PATH:/home/vagrant/bin/jython/bin
echo $PATH
