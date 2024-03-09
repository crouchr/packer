#!/usr/bin/env bash
# Zero Out empty space on disk to improve compression

echo "Clean up root partition..."
sudo dd if=/dev/zero of=/zero.fill bs=1M || echo "dd exit code $? is suppressed"
sudo rm -f /zero.fill;

# Zero Out empty space in /boot
echo "Clean up /boot partition..."
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
sudo dd if=/dev/zero of=/boot/zero.fill bs=1024 count=$count || echo "dd exit code $? is suppressed"
sudo rm /boot/zero.fill;

# Sync to ensure delete completes
sudo sync
sudo sync
