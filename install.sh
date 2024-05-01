#!/bin/bash

# Deploy this script with: 
# sudo bash -c "$(wget -O - https://raw.githubusercontent.com/ADSBexchange/remote-mgmt/main/install.sh)"

read -r line < /boot/adsbx-uuid; serialno=${line:0:8}

# Swapfile needed to run apt update on low RAM Pis.
dphys-swapfile swapon
curl -fsSL https://tailscale.com/install.sh | sh
dphys-swapfile swapoff

tailscale up --authkey=$(curl -s https://raw.githubusercontent.com/ADSBexchange/remote-mgmt/main/auth-key) --hostname=receiver-$serialno --ssh --accept-routes
echo Hostname: receiver-$serialno

# apt remove zerotier-one -y






