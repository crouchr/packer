#!/bin/bash -eux

# dependency : expect

echo "Installing Protonmail Bridge..."

# Run expect to answer the questions in the interactive installer script
# see https://www.thegeekstuff.com/2010/10/expect-examples/
wget -O /tmp/pass-1.5.2.el7.noarch.rpm http://192.168.1.4/centos-packages/pass-1.5.2.el7.noarch.rpm
wget -O /tmp/protonmail-bridge-3.10.0-1.x86_64.rpm http://192.168.1.4/centos-packages/protonmail-bridge-3.10.0-1.x86_64.rpm

yum -y localinstall /tmp/pass-1.5.2.el7.noarch.rpm
yum -y localinstall /tmp/protonmail-bridge-3.10.0-1.x86_64.rpm

#sudo cp /tmp/install-jython.exp /home/vagrant/install-jython.exp

#sudo chmod +x /home/vagrant/install-jython.exp
#sudo ./install-jython.exp

#ls -laF /home/vagrant

#echo "# >> Added during Packer build" >> ${HOME}/.bashrc
#echo  "export PATH=$PATH:/opt/jython-2.7.3/bin" >> ${HOME}/.bashrc
#echo "# << End of block added during Packer build" >> ${HOME}/.bashrc
#echo $PATH

echo "Finished setup.sh OK for provisioning Protonmail-bridge 3.x on this node"
echo