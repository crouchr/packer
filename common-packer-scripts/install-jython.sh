#!/bin/bash -eux

# dependency : expect

echo "Installing Jython..."
pwd     # This displayed /home/vagrant

# smoke check that java is installed
java --version

# Run expect to answer the questions in the interactive installer script
# see https://www.thegeekstuff.com/2010/10/expect-examples/
sudo mkdir -p /home/vagrant/installer

sudo cp /tmp/jython-installer.jar /home/vagrant/installer/jython-installer.jar
sudo cp /tmp/install-jython.exp /home/vagrant/installer/install-jython.exp

sudo chmod +x /home/vagrant/installer/install-jython.exp
sudo ./installer/install-jython.exp

ls -laF /home/vagrant

echo "# >> Added during Packer build" >> ${HOME}/.bashrc
echo  "export PATH=$PATH:/opt/jython-2.7.3/bin" >> ${HOME}/.bashrc
echo "# << End of block added during Packer build" >> ${HOME}/.bashrc
echo $PATH
