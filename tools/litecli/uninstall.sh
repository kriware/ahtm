#!/bin/bash

# Source common functions
source "$(dirname "$0")/../common.sh"

# Main uninstallation function
uninstall_litecli() {
    if ! pip3 show litecli &> /dev/null; then
        print_error "litecli is not installed."
        return 1
    fi

    if pip3 uninstall litecli -y -q > /dev/null 2>&1; then
        print_info "litecli uninstalled successfully."
    else
        print_error "Could not uninstall litecli."
        return 1
    fi

}

# Execute the main function
uninstall_litecli