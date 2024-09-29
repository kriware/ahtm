#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main uninstallation function
uninstall_frida() {
    if ! pip3 show frida-tools &> /dev/null; then
        print_error "Frida is not installed."
        return 1
    fi

    # Uninstall Frida
    if pip3 uninstall frida-tools -y -q > /dev/null 2>&1; then
        print_info "Frida uninstalled successfully."
    else
        print_error "Could not uninstall Frida."
        return 1
    fi

    # Remove Frida CLI tools
    print_info "Removing Frida CLI tools..."
    sudo rm -f /usr/local/bin/frida /usr/local/bin/frida-ls-devices /usr/local/bin/frida-ps /usr/local/bin/frida-trace

    # Clean up any remaining dependencies
    print_info "Cleaning up dependencies..."
    if pip3 uninstall frida -y -q > /dev/null 2>&1; then
        print_info "Dependencies cleaned up successfully."
    else
        print_error "Could not clean up dependencies."
        return 1
    fi
}

# Execute the main function
uninstall_frida