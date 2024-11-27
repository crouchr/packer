#!/usr/bin/env bash
# It is most useful to run haveged on the guest VM, especially if the guest does not have access to a hardware RNG.
# Virtual machines typically don't have access to the physical hardware's entropy sources (like hardware RNG),
# and running haveged on the guest can help ensure that the VM has access to good randomness.
# In many virtualized environments, such as those running on Hyper-V, VMware, or VirtualBox,
# the virtual machine may lack sufficient entropy for secure cryptographic operations, so haveged can help mitigate this issue.
# haveged stands for Hardware Random Number Generator Daemon.
#
# Optional: Check entropy level
# cat /proc/sys/kernel/random/entropy_avail

echo "Installing haveged RNG daemon..."
sudo yum -y install haveged

echo "Starting haveged..."
sudo systemctl enable haveged
sudo systemctl start haveged

echo "Installed haveged RNG daemon."
