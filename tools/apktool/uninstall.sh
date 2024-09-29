#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Check if Apktool is installed
if ! apktool --version &> /dev/null; then
    print_error "Apktool is not installed."
    exit 0
fi

# Get the installed Apktool version
APKTOOL_VERSION=$(apktool --version | grep -oP '\d+\.\d+\.\d+')

if [ -z "$APKTOOL_VERSION" ]; then
    print_error "Unable to determine Apktool version."
    exit 1
fi

print_info "Uninstalling Apktool version $APKTOOL_VERSION..."

# Remove Apktool files
rm -f /usr/local/bin/apktool
rm -f /usr/local/bin/apktool.jar

# Check if uninstallation was successful
if [ $? -eq 0 ]; then
    print_success "Apktool $APKTOOL_VERSION has been successfully uninstalled."
else
    print_error "Failed to uninstall Apktool. You may need to remove it manually."
    exit 1
fi