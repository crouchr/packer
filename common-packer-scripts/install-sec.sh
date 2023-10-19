#!/bin/bash -eux

echo "Installing SEC Event Correlator..."

sudo wget --no-check-certificate \
   https://kojipkgs.fedoraproject.org//packages/sec/2.9.2/1.el7/noarch/sec-2.9.2-1.el7.noarch.rpm \

sudo yum -y install sec-2.9.2-1.el7.noarch.rpm
