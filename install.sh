#!/bin/bash

ephem_auth_key="tskey-auth-kJjGTi6uNL11CNTRL-XpaxYZj2wkQtKtGCKZvnkQ9Jzjiu8r5UM"
read -r line < /boot/adsbx-uuid; serialno=${line:0:8}

curl -fsSL https://tailscale.com/install.sh | sh

tailscale up --ssh --hostname=receiver-$serialno --authkey=$ephem_auth_key





