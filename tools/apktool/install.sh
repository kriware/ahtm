#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Get the latest apktool version
APKTOOL_VERSION=$(wget -qO- "https://api.github.com/repos/iBotPeaches/Apktool/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

# Validate version format
if ! validate_version "$APKTOOL_VERSION"; then
    print_error "Failed to get a valid apktool version. Got: $APKTOOL_VERSION"
    exit 1
fi

# Check if apktool is already installed
if apktool --version &> /dev/null; then
    print_error "apktool is already installed..."
    exit 1
fi

print_info "Installing apktool version $APKTOOL_VERSION..."

# Download apktool
if ! wget -q "https://github.com/iBotPeaches/Apktool/releases/download/v$APKTOOL_VERSION/apktool_$APKTOOL_VERSION.jar" -O "apktool.jar"; then
    print_error "Failed to download apktool JAR"
    exit 1
fi

if ! wget -q "https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool" -O "apktool"; then
    print_error "Failed to download apktool script"
    rm "apktool.jar"
    exit 1
fi

# Move apktool files to /usr/local/bin
mv "apktool.jar" "/usr/local/bin/apktool.jar"
mv "apktool" "/usr/local/bin/apktool"

# Set correct permissions
chmod +x "/usr/local/bin/apktool.jar"
chmod +x "/usr/local/bin/apktool"