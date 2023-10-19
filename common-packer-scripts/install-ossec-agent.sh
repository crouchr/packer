#!/usr/bin/env bash
# Do not run this yet - it prompts for answers
# https://www.vultr.com/docs/how-to-install-ossec-hids-on-a-centos-7-server/

echo 'Installing OSSEC agent...'

sudo yum install -y inotify-tools

# Add Yum repo configuration
#wget -q -O - https://updates.atomicorp.com/installers/atomic | sudo bash

# Server
# sudo yum install -y ossec-hids-server

# Agent
#sudo yum install -y ossec-hids-agent
