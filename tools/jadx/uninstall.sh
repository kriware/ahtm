#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Check if JADX is installed
if ! jadx --version &> /dev/null; then
    print_error "JADX is not installed."
    exit 0
fi

# Get the installed JADX version
JADX_VERSION=$(jadx --version | grep -oP '\d+\.\d+\.\d+')

if [ -z "$JADX_VERSION" ]; then
    print_error "Unable to determine JADX version."
    exit 1
fi

print_info "Uninstalling JADX version $JADX_VERSION..."

# Remove symbolic links
rm -f /usr/local/bin/jadx
rm -f /usr/local/bin/jadx-gui

# Remove JADX directory
rm -rf "/usr/local/bin/jadx-$JADX_VERSION"

# Check if uninstallation was successful
if [ $? -eq 0 ]; then
    print_success "JADX $JADX_VERSION has been successfully uninstalled."
else
    print_error "Failed to uninstall JADX. You may need to remove it manually."
    exit 1
fi
