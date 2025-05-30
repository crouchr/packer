#!/bin/bash -eux

echo "Installing TRADR Shell..."

sudo cp /tmp/tradr-shell /usr/bin/tradr-shell
sudo chmod +x /usr/bin/tradr-shell

# my 'richard' account is my normal user
sudo usermod -s /usr/bin/tradr-shell admin
sudo usermod -s /usr/bin/tradr-shell adrian
sudo usermod -s /usr/bin/tradr-shell amelia
sudo usermod -s /usr/bin/tradr-shell banks
sudo usermod -s /usr/bin/tradr-shell bitcoin
sudo usermod -s /usr/bin/tradr-shell bollinger
sudo usermod -s /usr/bin/tradr-shell bonds
sudo usermod -s /usr/bin/tradr-shell candlestick
sudo usermod -s /usr/bin/tradr-shell chris
sudo usermod -s /usr/bin/tradr-shell commodities
sudo usermod -s /usr/bin/tradr-shell correlation
sudo usermod -s /usr/bin/tradr-shell currency
sudo usermod -s /usr/bin/tradr-shell dividend
sudo usermod -s /usr/bin/tradr-shell elliot
sudo usermod -s /usr/bin/tradr-shell energy
sudo usermod -s /usr/bin/tradr-shell futures
sudo usermod -s /usr/bin/tradr-shell global
sudo usermod -s /usr/bin/tradr-shell gold
sudo usermod -s /usr/bin/tradr-shell healthcare
sudo usermod -s /usr/bin/tradr-shell industrials
sudo usermod -s /usr/bin/tradr-shell insider
sudo usermod -s /usr/bin/tradr-shell johnnybench
sudo usermod -s /usr/bin/tradr-shell miners
sudo usermod -s /usr/bin/tradr-shell mrp
sudo usermod -s /usr/bin/tradr-shell oil
sudo usermod -s /usr/bin/tradr-shell oscar
sudo usermod -s /usr/bin/tradr-shell quantum
sudo usermod -s /usr/bin/tradr-shell qwave
sudo usermod -s /usr/bin/tradr-shell reits
sudo usermod -s /usr/bin/tradr-shell revesting
sudo usermod -s /usr/bin/tradr-shell revesting2
sudo usermod -s /usr/bin/tradr-shell revesting3
sudo usermod -s /usr/bin/tradr-shell revesting4
sudo usermod -s /usr/bin/tradr-shell richard
sudo usermod -s /usr/bin/tradr-shell silver
sudo usermod -s /usr/bin/tradr-shell sector
sudo usermod -s /usr/bin/tradr-shell sector2
sudo usermod -s /usr/bin/tradr-shell shorts
sudo usermod -s /usr/bin/tradr-shell simon
sudo usermod -s /usr/bin/tradr-shell sniper
sudo usermod -s /usr/bin/tradr-shell staples
sudo usermod -s /usr/bin/tradr-shell tester
sudo usermod -s /usr/bin/tradr-shell volume
sudo usermod -s /usr/bin/tradr-shell watcher
sudo usermod -s /usr/bin/tradr-shell water
sudo usermod -s /usr/bin/tradr-shell weinstein

sudo touch /var/log/tradr_shell.log

# FIXME - should not need 777 permissions
sudo chmod 777 /var/log/tradr_shell.log

sudo chown root:root /var/log/tradr_shell.log

echo "Installed TRADR Shell."
