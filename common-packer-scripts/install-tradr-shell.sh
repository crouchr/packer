#!/bin/bash -eux

echo "Installing TRADR Shell..."

sudo cp /tmp/tradr-shell /usr/bin/tradr-shell

sudo usermod -s /usr/bin/tradr-shell adrian
sudo usermod -s /usr/bin/tradr-shell richard

sudo touch /var/log/tradr_shell.log

# FIXME - should not need 777 permissions
sudo chmod 777 /var/log/tradr_shell.log

sudo chown root:root /var/log/tradr_shell.log

echo "Installed TRADR Shell."
