#!/bin/bash -eux
# - see https://www.syslog-ng.com/community/b/blog/posts/installing-latest-syslog-ng-on-rhel-and-other-rpm-distributions

echo
echo "Started setup.sh for provisioning syslog-ng on this node"

sudo yum -y install syslog-ng

#
#sudo cp /tmp/syslog-ng.conf /etc/syslog-ng.conf

echo "Enable syslog-ng services..."
sudo systemctl enable syslog-ng

echo "Start syslog-ng services..."
sudo systemctl start syslog-ng

echo "Uninstall rsyslog..."
sudo yum -y erase rsyslog

echo "Finished setup.sh OK for provisioning syslog-ng on this node"
echo
