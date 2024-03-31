#!/bin/bash -eux

echo "Installing Jython..."

# Do the install here once I know what it is
cd /tmp
java -jar jython-installer-2.7.3.jar <<END
E
N
Y
2
N
N
/home/vagrant/bin/jython
Y
Y
N
END

#./myscript.sh <<END
#my name
#my age
#END

echo "# >> Added during Packer build" >> ${HOME}/.bashrc
echo  "export PATH=$PATH:/home/vagrant/bin/jython/bin" >> ${HOME}/.bashrc
echo "# << End of block added during Packer build" >> ${HOME}/.bashrc

echo $PATH
