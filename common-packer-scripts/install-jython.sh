#!/bin/bash -eux

echo "Installing Jython..."

# Use expect to drive the installer
sudo yum -y install expect

# Run expect to answer the questions in the interactive installer script
sudo ./install-jython.exp

echo "# >> Added during Packer build" >> ${HOME}/.bashrc
echo  "export PATH=$PATH:/home/vagrant/bin/jython/bin" >> ${HOME}/.bashrc
echo "# << End of block added during Packer build" >> ${HOME}/.bashrc

echo $PATH
