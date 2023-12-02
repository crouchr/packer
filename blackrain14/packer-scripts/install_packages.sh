#!/bin/bash
# The code for the sensors is not getting regular updates so this script is not expected to change 
# very frequently

set -e

echo "Install Snort and its dependencies"
wget -q http://192.168.1.102://slackware/slackware-14-2/libdnet-1.11-x86_64-1.txz
installpkg --terse libdnet-1.11-x86_64-1.txz

wget -q http://192.168.1.102://slackware/slackware-14-2/daq-2.0.7-x86_64-1.txz
installpkg --terse daq-2.0.7-x86_64-1.txz

wget -q http://192.168.1.102://slackware/slackware-14-2/lua-5.1.5-1_SBo.tgz
installpkg --terse lua-5.1.5-1_SBo.tgz

