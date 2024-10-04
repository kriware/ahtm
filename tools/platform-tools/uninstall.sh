#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

set -e  # Exit immediately if a command exits with a non-zero status.

INSTALL_DIR="/usr/local/bin/platform-tools"

# Remove installation directory if it exists
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    print_info "Removed platform-tools directory."
else
    print_info "Platform-tools directory not found. Skipping removal."
fi

# Remove PATH entry from .bashrc
if grep -q "$INSTALL_DIR" ~/.bashrc; then
    sed -i '/# Android SDK platform tools/,+3d' ~/.bashrc
    print_info "Removed platform-tools from PATH in .bashrc"
else
    print_info "No PATH entry found in .bashrc. Skipping removal."
fi

print_info "Uninstallation complete. Please restart your terminal or run 'source ~/.bashrc'"
