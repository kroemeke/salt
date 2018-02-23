#!/bin/bash

wget -o bootstrap-salt.sh https://bootstrap.saltstack.com
./bootstrap-salt.sh

sleep 5
systemctl stop salt-minion
systemctl disable salt-minion

find /etc/salt/ -type d -delete
mkdir /etc/salt/minion.d
cat <<EOF > /etc/salt/minion.d/local.conf
file_client: local
file_roots:
  base:
      - /etc/salt/base
EOF
