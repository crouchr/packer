#!/bin/bash -eux

echo "Installing TRADR Shell..."

sudo cp /tmp/tradr-shell /usr/bin/tradr-shell

sudo usermod -s /usr/bin/tradr-shell adrian
sudo usermod -s /usr/bin/tradr-shell richard

echo "Installed TRADR Shell."
