#!/bin/bash

feeder_auth_key="tskey-auth-kq7EBS6R9b11CNTRL-ydTE4VdXNiMztLGwkHZYiMqKMnGbCNbvV"
read -r line < /boot/adsbx-uuid; serialno=${line:0:8}

curl -fsSL https://tailscale.com/install.sh | sh

tailscale up --authkey=$feeder_auth_key --hostname=receiver-$serialno --ssh --accept-routes





