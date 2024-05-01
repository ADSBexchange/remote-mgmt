#!/bin/bash

# Deploy this script with: 
# sudo bash -c "$(wget -O - https://raw.githubusercontent.com/ADSBexchange/remote-mgmt/main/install.sh)"

read -r line < /boot/adsbx-uuid; serialno=${line:0:8}

# Swapfile needed to run apt update on low RAM Pis.
if swapon --summary | grep -q "^"; then
    echo "Swap is already active."
else
    # Activate the swap file using dphys-swapfile
    echo "Activating swap..."
    sudo dphys-swapfile swapon
    echo "Swap activated."
fi


curl -fsSL https://tailscale.com/install.sh | sh
dphys-swapfile swapoff

tailscale up --authkey=$(curl -s https://raw.githubusercontent.com/ADSBexchange/remote-mgmt/main/auth-key) --hostname=receiver-$serialno --ssh --accept-routes
echo Hostname: receiver-$serialno

# apt remove zerotier-one -y






