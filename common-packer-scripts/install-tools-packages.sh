#!/bin/bash -eux

# Core utilities
sudo yum install -y yum-utils wget lsof net-tools htop tcpdump traceroute tcpflow

# Add packages I personally like to use
sudo yum install -y joe shadow-utils tree ncdu
