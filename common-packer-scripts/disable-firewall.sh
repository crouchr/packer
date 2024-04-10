#!/bin/bash -eux
# Once everything working then re-instate firewall and add kibana and grafana ports opened

echo 'Running disable-firewall.sh to disable firewall...'

sudo firewall-cmd --state
sudo systemctl disable firewalld
sudo systemctl stop firewalld
sudo firewall-cmd --state
