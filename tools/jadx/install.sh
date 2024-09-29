#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Get the latest jadx version
JADX_VERSION=$(wget -qO- "https://api.github.com/repos/skylot/jadx/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

# Validate version format
if ! validate_version "$JADX_VERSION"; then
    print_error "Failed to get a valid jadx version. Got: $JADX_VERSION"
    exit 1
fi

# Check if jadx is already installed
if jadx --version &> /dev/null; then
    print_error "jadx is already installed..."
    exit 1
fi

print_info "Installing jadx version $JADX_VERSION..."

# Download jadx
if ! wget -q "https://github.com/skylot/jadx/releases/download/v$JADX_VERSION/jadx-$JADX_VERSION.zip"; then
    print_error "Failed to download jadx"
    exit 1
fi

# Move and unzip jadx
mv "jadx-$JADX_VERSION.zip" "/usr/local/bin/jadx-$JADX_VERSION.zip"
if ! unzip -q "/usr/local/bin/jadx-$JADX_VERSION.zip" -d "/usr/local/bin/jadx-$JADX_VERSION"; then
    print_error "Failed to unzip jadx"
    rm "/usr/local/bin/jadx-$JADX_VERSION.zip"
    exit 1
fi

# Clean up and create symbolic links
rm "/usr/local/bin/jadx-$JADX_VERSION.zip"
ln -sf "/usr/local/bin/jadx-$JADX_VERSION/bin/jadx" "/usr/local/bin/jadx"
ln -sf "/usr/local/bin/jadx-$JADX_VERSION/bin/jadx-gui" "/usr/local/bin/jadx-gui"