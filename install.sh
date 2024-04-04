#!/bin/bash

ephem_auth_key="tskey-auth-kpCKaLg84v11CNTRL-YFaEuPqS5eWPZzxa4m43kW93ppwPwK35"

curl -fsSL https://tailscale.com/install.sh | sh
read -r line < /boot/adsbx-uuid; serialno=${line:0:8}
tailscale up --hostname=receiver-$serialno --authkey=$ephem_auth_key





