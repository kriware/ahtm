#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

INSTALL_DIR="/usr/local/bin/platform-tools"

# Remove installation directory if it exists
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    echo "[INFO] Removed platform-tools directory."
else
    echo "[INFO] Platform-tools directory not found. Skipping removal."
fi

# Remove PATH entry from .bashrc
if grep -q "$INSTALL_DIR" ~/.bashrc; then
    sed -i '/# Android SDK platform tools/,+3d' ~/.bashrc
    echo "[INFO] Removed platform-tools from PATH in .bashrc"
else
    echo "[INFO] No PATH entry found in .bashrc. Skipping removal."
fi

echo "[INFO] Uninstallation complete. Please restart your terminal or run 'source ~/.bashrc'"
