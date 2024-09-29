#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status.

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

INSTALL_DIR="/usr/local/bin/platform-tools"
ZIP_FILE="platform-tools-latest-linux.zip"
DOWNLOAD_URL="https://dl.google.com/android/repository/$ZIP_FILE"

# Remove old installation and zip file if they exist
[ -d "$INSTALL_DIR" ] && rm -rf "$INSTALL_DIR"
[ -f "$ZIP_FILE" ] && rm "$ZIP_FILE"

# Download platform tools
if wget -q "$DOWNLOAD_URL"; then
    echo "[INFO ] Download successful."
else
    echo "[ERROR] Download failed. Exiting."
    exit 1
fi

# Unzip the downloaded file
if unzip -q "$ZIP_FILE" -d "$(dirname "$INSTALL_DIR")"; then
    echo "[INFO ] Extraction successful."
else
    echo "[ERROR] Extraction failed. Exiting."
    exit 1
fi

# Remove the zip file
rm "$ZIP_FILE"

# Add to PATH only if not already present
if ! grep -q "$INSTALL_DIR" ~/.bashrc; then
    echo "
# Android SDK platform tools
if [ -d \"$INSTALL_DIR\" ] ; then
    PATH=\"$INSTALL_DIR:\$PATH\"
fi" >> ~/.bashrc
    echo "[INFO ] Added platform-tools to PATH in .bashrc"
    
else
    echo "[INFO ] platform-tools already in PATH"
fi

echo "[INFO ] Installation complete. Please restart your terminal or run 'source ~/.bashrc'"