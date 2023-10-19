#!/bin/bash -eux
# Install telegraf on node - Chef will be used to configure it
# Put influxdb on another node
# https://www.digitalocean.com/community/tutorials/how-to-monitor-system-metrics-with-the-tick-stack-on-centos-7

echo "Installing telegraf..."

sudo wget --no-check-certificate \
   http://web.ermin.lan/br2020-packages/influxdata.repo \
   -O /etc/yum.repos.d/influxdata.repo

sudo yum -y install telegraf
