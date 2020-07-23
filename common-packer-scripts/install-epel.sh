#!/bin/bash -eux
# This is used by honeypot so do NOT run yum update - want it unpatched

# Add the EPEL repo
sudo yum install -y epel-release

