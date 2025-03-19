#!/bin/bash -eux

echo "Installing TRADR Shell..."

sudo cp /tmp/tradr-shell /usr/bin/tradr-shell
sudo chmod +x /usr/bin/tradr-shell

# my 'richard' account is my normal user
sudo usermod -s /usr/bin/tradr-shell admin
sudo usermod -s /usr/bin/tradr-shell johnnybench
sudo usermod -s /usr/bin/tradr-shell sector
sudo usermod -s /usr/bin/tradr-shell sector2
sudo usermod -s /usr/bin/tradr-shell sniper
sudo usermod -s /usr/bin/tradr-shell revesting
sudo usermod -s /usr/bin/tradr-shell revesting2
sudo usermod -s /usr/bin/tradr-shell revesting3
sudo usermod -s /usr/bin/tradr-shell revesting4
sudo usermod -s /usr/bin/tradr-shell shorts
sudo usermod -s /usr/bin/tradr-shell bitcoin
sudo usermod -s /usr/bin/tradr-shell currency
sudo usermod -s /usr/bin/tradr-shell watcher
sudo usermod -s /usr/bin/tradr-shell tester
sudo usermod -s /usr/bin/tradr-shell bollinger
sudo usermod -s /usr/bin/tradr-shell candlestick
sudo usermod -s /usr/bin/tradr-shell dividend
sudo usermod -s /usr/bin/tradr-shell precious
sudo usermod -s /usr/bin/tradr-shell weinstein
sudo usermod -s /usr/bin/tradr-shell correlation
sudo usermod -s /usr/bin/tradr-shell miners
sudo usermod -s /usr/bin/tradr-shell richard
sudo usermod -s /usr/bin/tradr-shell elliot
sudo usermod -s /usr/bin/tradr-shell amelia
sudo usermod -s /usr/bin/tradr-shell simon
sudo usermod -s /usr/bin/tradr-shell adrian
sudo usermod -s /usr/bin/tradr-shell adriantesting
sudo usermod -s /usr/bin/tradr-shell oscar

sudo touch /var/log/tradr_shell.log

# FIXME - should not need 777 permissions
sudo chmod 777 /var/log/tradr_shell.log

sudo chown root:root /var/log/tradr_shell.log

echo "Installed TRADR Shell."
