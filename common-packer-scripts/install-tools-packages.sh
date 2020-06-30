#!/bin/bash -eux

# Core utilities
# chef needs git
sudo yum install -y yum-utils git wget lsof net-tools htop tcpdump traceroute tcpflow bind-utils

# Add packages I personally like to use
sudo yum install -y joe shadow-utils tree ncdu
