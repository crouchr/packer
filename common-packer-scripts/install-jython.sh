#!/bin/bash -eux

echo "Installing Jython..."
pwd     # This displayed /home/vagrant

# smoke check that java is installed
# java --version

# Use expect to drive the installer
sudo yum -y install expect

# Run expect to answer the questions in the interactive installer script
# see https://www.thegeekstuff.com/2010/10/expect-examples/

sudo cp /tmp/jython-installer-2.7.3.jar /home/vagrant/jython-installer-2.7.3.jar
sudo cp /tmp/install-jython.exp /home/vagrant/install-jython.exp

# sudo chmod +x /home/vagrant/install-jython.exp
# sudo ./install-jython.exp

ls -laF /home/vagrant

echo "# >> Added during Packer build" >> ${HOME}/.bashrc
echo  "export PATH=$PATH:/home/vagrant/bin/jython/bin" >> ${HOME}/.bashrc
echo "# << End of block added during Packer build" >> ${HOME}/.bashrc

echo $PATH
