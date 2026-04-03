#!/bin/bash

# === MONEROOCEAN MAC MINER ===

WALLET="483dhPFGREDdXmHiC5gsPtMDxdbkPzSnn7MPCSLmwEiUHduGB8UffVAV8LTdZGe3mrGMoy9rHWyk1BmB9HRYNvEF2VuAYYv"
WORKER_NAME="mac_rig"
DIR="$HOME/moneroocean_mac"

echo "======================================"
echo " Starting MoneroOcean Miner for Mac"
echo "======================================"

mkdir -p "$DIR"
cd "$DIR"

# 1. Check if miner is already downloaded
if [ ! -f "./xmrig" ]; then
    ARCH=$(uname -m)
    if [ "$ARCH" = "arm64" ]; then
        echo "Detected Apple Silicon (M1/M2/M3). Downloading arm64 version..."
        URL="https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-macos-arm64.tar.gz"
    else
        echo "Detected Intel Mac. Downloading x64 version..."
        URL="https://github.com/xmrig/xmrig/releases/download/v6.26.0/xmrig-6.26.0-macos-x64.tar.gz"
    fi
    
    curl -L -s -o xmrig.tar.gz "$URL"
    tar -xzf xmrig.tar.gz --strip-components=1
    rm xmrig.tar.gz
    
    # 2. Bypass macOS Gatekeeper (stops the "Unverified Developer" popup)
    xattr -r -d com.apple.quarantine ./xmrig 2>/dev/null
fi

# 3. Start mining
echo ""
echo "Starting miner! (You may be asked for the Mac password to allow optimal CPU access)"
sudo ./xmrig -o gulf.moneroocean.stream:10128 -u "$WALLET" -p "$WORKER_NAME"
